class DailyPlanTask < ApplicationRecord
  belongs_to :daily_plan
  belongs_to :task
end
