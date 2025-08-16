FactoryBot.define do
  factory :exercise do
    workout_name
    exercise_status
    day_id { create(:day)&.id }
  end

  trait :with_schedule do
    before(:create) do |instance|
      schedule = FactoryBot.create(:schedule)
      week = schedule.weeks.create(week_status: FactoryBot.create(:week_status))
      week.days.create
    end
  end
end
