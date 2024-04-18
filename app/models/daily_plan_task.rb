class DailyPlanTask < ApplicationRecord
  belongs_to :daily_plan
  belongs_to :task

  validates :time_slot_start, presence: true
  validates :time_slot_end, presence: true
end
