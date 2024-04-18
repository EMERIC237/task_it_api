FactoryBot.define do
  factory :daily_plan_task do
    association :daily_plan
    association :task
    time_slot_start { Faker::Time.forward(days: 1, period: :morning) }
    time_slot_end { Faker::Time.forward(days: 1, period: :afternoon) }
  end
end
