class Schedule < ApplicationRecord
  validates :title, presence: true, allow_nil: false

  has_many :weeks
  belongs_to :user

  def self.import(current_user, file)
    xlsx = Roo::Excelx.new(file.path)

    new_schedule = current_user.schedules.create(title: xlsx.sheet(0).row(1)[0])
    week_num = 0
    xlsx.each_row_streaming(offest: 1) do |row|
      # binding.pry if new_week?(row)
      @new_week = new_schedule.weeks.create!(number: week_num += 1)  if new_week?(row)
      if is_a_workout_day?(row)
        @new_week.days.create!(day_name_id: find_day(row), phase_id: find_phase(row), level_id: find_level(row), workout: row[5].value, workout_name_id: find_workout_name(row), intensity: row[8].value)
      end
    end
    p new_schedule.weeks.flat_map(&:days)
    new_schedule.save
    new_schedule
  end

  private
  def self.new_week?(row)
    row.map(&:cell_value).include?("Set 1")
  end

  def self.is_a_workout_day?(row)
    row[0].present? && row[1].present? && row.map(&:cell_value).exclude?("Set 1")
  end

  def self.find_phase(row)
    Phase.find_or_create_by(number: row[1].value).id
  end
  def self.find_day(row)
    DayName.find_or_create_by(name: row[4].value.downcase).id
  end

  def self.find_level(row)
    Level.find_or_create_by(number: row[0].value.downcase).id
  end

  def self.find_workout_name(row)
    WorkoutName.find_or_create_by(name: row[6].value).id
  end
end
