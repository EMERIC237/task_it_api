class FixDailyPlanTasksForeignKey < ActiveRecord::Migration[7.1]
  def change
    add_column :daily_plan_tasks, :daily_plan_id, :integer
    add_foreign_key :daily_plan_tasks, :daily_plans, column: :daily_plan_id
  end
end
