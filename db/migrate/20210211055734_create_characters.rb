class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.string :character_name, null: false
      t.integer :pc_number, null: false
      t.references :room, null: false, foreign_key: true
      t.timestamps
    end
  end
end
