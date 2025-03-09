FactoryBot.define do
  factory :user do
    sequence(:email_address) { |n| "moo-#{n}@example.com" }
    password { 'moo' }
  end
end
