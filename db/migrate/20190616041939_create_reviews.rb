class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :whiskey_name
      t.string :rating
      t.text :review
      t.integer :whiskey_entry_id
      t.integer :user_id

      t.timestamps
    end
  end
end
