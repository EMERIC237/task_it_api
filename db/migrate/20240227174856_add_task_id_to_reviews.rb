class AddTaskIdToReviews < ActiveRecord::Migration[7.1]
  def change
    add_column :reviews, :task_id, :integer
    add_index :reviews, :task_id
    add_foreign_key :reviews, :tasks
  end
end
