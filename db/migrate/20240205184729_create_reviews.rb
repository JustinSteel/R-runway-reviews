class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :airport_id
      t.text :comment
      t.integer :category, default: 0

      t.timestamps
    end
  end
end
