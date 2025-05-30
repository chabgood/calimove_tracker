class Schedule < ApplicationRecord
  validates :title, presence: true, allow_nil: false
  has_many :weeks, dependent: :destroy

  accepts_nested_attributes_for :weeks, reject_if: :all_blank, allow_destroy: true
  belongs_to :user

  def self.import(current_user, file)
    xlsx = open_spreadsheet(file)
    sets = JSON.parse(` python3 lib/parse_excel.py #{file.path}`.chomp)
    new_schedule = current_user.schedules.create!(title: xlsx.sheet(0).row(1)[0])
    week_num = 0
    xlsx.each_row_streaming(offest: 1) do |row|
      @new_week = new_schedule.weeks.create!(number: week_num += 1, week_statuses_id: WeekStatus.find_by(name: "ready")&.id)  if new_week?(row)
      if is_a_workout_day?(row)
        day = @new_week.days.includes(:day_name).find_or_create_by(day_name_id: find_day_id(row))
        exercise = day.exercises.build(phase_id: find_phase_id(row), level_id: find_level_id(row),
          workout: row[5].value, workout_name_id: find_workout_name_id(row), number: row[7], intensity: row[8].value)
        if row[5].value.starts_with?("T")
          rt = RestTime.find_or_create_by(name: "10-15 minutes")
          exercise.rest_between_exercises_id = rt.id
          exercise.exercise_statuses_id = ExerciseStatus.find_by(name: "test")&.id
        else
          exercise.exercise_statuses_id = ExerciseStatus.find_by(name: "work")&.id
        end
        exercise.save
        day.save!
      end
    end
    new_schedule.save!
    new_schedule.weeks.flat_map(&:days).flat_map(&:exercises).each_with_index do |exercise, index|
      exercise.update!(sets: sets[index])
    end
    new_schedule
  end

  def self.open_spreadsheet(file)
    case File.extname(file.path)
    when ".csv" then Roo::Csv.new(file.path)
    when ".xls" then Roo::Excel.new(file.path)
    when ".xlsx" then Roo::Excelx.new(file.path)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

  private
  def self.new_week?(row)
    row.map(&:cell_value).include?("Set 1")
  end

  def self.is_a_workout_day?(row)
    row[0].present? && row[1].present? && row.map(&:cell_value).exclude?("Set 1")
  end

  def self.find_phase_id(row)
    Phase.find_or_create_by(number: row[1].value).id
  end
  def self.find_day_id(row)
    DayName.find_or_create_by(name: row[4].value.titleize).id
  end

  def self.find_level_id(row)
    Level.find_or_create_by(number: row[0].value.downcase).id
  end

  def self.find_workout_name_id(row)
    WorkoutName.find_or_create_by(name: row[6].value).id
  end
end
