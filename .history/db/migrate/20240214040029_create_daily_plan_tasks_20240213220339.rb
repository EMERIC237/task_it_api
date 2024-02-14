class CreateDailyPlanTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :daily_plan_tasks do |t|
      t.references :plan, null: false, foreign_key: true
      t.references :task, null: false, foreign_key: true
      t.datetime :time_slot_start
      t.datetime :time_slot_end

      t.timestamps
    end
  end
end
