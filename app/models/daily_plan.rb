class DailyPlan < ApplicationRecord
  belongs_to :user
   # Has many tasks through daily_plan_tasks join table
   has_many :daily_plan_tasks
   has_many :tasks, through: :daily_plan_tasks
end
