class CreateWhiskeyEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :whiskey_entries do |t|
      t.string :image
      t.integer :user_id
      t.string :whiskey_name
      t.integer :type_id
      t.integer :rating
      t.text :note_text
      t.string :price

      t.timestamps
    end
  end
end
