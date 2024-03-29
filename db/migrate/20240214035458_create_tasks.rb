class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.string :priority
      t.string :status
      t.datetime :deadline

      t.timestamps
    end
  end
end
