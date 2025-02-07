class Schedule < ApplicationRecord
  validates :title, presence: true, allow_nil: false

  has_many :weeks
  belongs_to :user

  def self.import(current_user, file)
    xlsx = open_spreadsheet(file)

    new_schedule = current_user.schedules.create!(title: xlsx.sheet(0).row(1)[0])
    week_num = 0
    xlsx.each_row_streaming(offest: 1) do |row|
      # binding.pry if new_week?(row)
      @new_week = new_schedule.weeks.create!(number: week_num += 1)  if new_week?(row)
      if is_a_workout_day?(row)
        day = @new_week.days.includes(:day_name).find_or_create_by(day_name_id: find_day_id(row))
        day.exercises.includes(:level, :phase, :workout_name).create(phase_id: find_phase_id(row), level_id: find_level_id(row), workout: row[5].value, workout_name_id: find_workout_name_id(row), intensity: row[8].value)
      end
    end
    new_schedule.save
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
    DayName.find_or_create_by(name: row[4].value.downcase).id
  end

  def self.find_level_id(row)
    Level.find_or_create_by(number: row[0].value.downcase).id
  end

  def self.find_workout_name_id(row)
    @find_workout_name_id ||= WorkoutName.find_or_create_by(name: row[6].value).id
  end
end
