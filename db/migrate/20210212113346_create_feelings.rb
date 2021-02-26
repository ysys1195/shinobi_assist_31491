class CreateFeelings < ActiveRecord::Migration[6.0]
  def change
    create_table :feelings do |t|
      t.integer :feel_id, null: false
      t.string :feeling_to, null: false
      t.references :character, null: false, foreign_key: true
      t.timestamps
    end
  end
end
