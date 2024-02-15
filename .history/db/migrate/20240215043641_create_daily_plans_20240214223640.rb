class CreateDailyPlans < ActiveRecord::Migration[7.1]
  def change
    create_table :daily_plans do |t|
      t.references :user, null: false, foreign_key: true
      t.date :date
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
