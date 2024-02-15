class FixDailyPlanTasksForeignKey < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :daily_plan_tasks, :plans
    add_foreign_key :daily_plan_tasks, :daily_plans
  end
end
