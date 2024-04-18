FactoryBot.define do
  factory :daily_plan do
    association :user
    date { Faker::Date.forward(days: 23) }
  end
end
