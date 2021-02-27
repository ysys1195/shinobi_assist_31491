class CreateLastResorts < ActiveRecord::Migration[6.0]
  def change
    create_table :last_resorts do |t|
      t.integer :last_resort_n, null: false
      t.text :last_resort, null: false
      t.references :character, null: false, foreign_key: true
      t.timestamps
    end
  end
end
