class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.datetime :date
      t.text :summary
      t.text :action_items

      t.timestamps
    end
  end
end
