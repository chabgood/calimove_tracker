FactoryBot.define do
  factory :exercise do
    workout_name
    exercise_status
    day_id { create(:day)&.id }
  end
end
