FactoryBot.define do
  factory :week do
    week_status { create(:week_status) }
    schedule
  end
end
