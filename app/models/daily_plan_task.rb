class DailyPlanTask < ApplicationRecord
  belongs_to :plan
  belongs_to :task
end
