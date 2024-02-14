class CreateTimeEntries < ActiveRecord::Migration[7.1]
  def change
    create_table :time_entries do |t|
      t.references :task, null: false, foreign_key: true
      t.datetime :start_time
      t.datetime :end_time
      t.integer :duration

      t.timestamps
    end
  end
end
