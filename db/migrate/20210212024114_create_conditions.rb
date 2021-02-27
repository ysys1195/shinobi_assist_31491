class CreateConditions < ActiveRecord::Migration[6.0]
  def change
    create_table :conditions do |t|
      t.integer :state_id, null: false
      t.references :character, null: false, foreign_key: true
      t.timestamps
    end
  end
end
