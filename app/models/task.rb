class Task < ApplicationRecord
  belongs_to :user
  # Has many daily plans through daily_plan_tasks join table
  has_many :daily_plan_tasks
  has_many :daily_plans, through: :daily_plan_tasks
  has_many :time_entries, dependent: :destroy
  has_many :reviews, dependent: :destroy
end
