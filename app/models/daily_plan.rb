class DailyPlan < ApplicationRecord
  belongs_to :user
  has_many :daily_plan_tasks
  has_many :tasks, through: :daily_plan_tasks

  validates :date, presence: true, uniqueness: { scope: :user_id }
end
