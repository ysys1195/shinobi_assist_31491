class CreateOpenLastResorts < ActiveRecord::Migration[6.0]
  def change
    create_table :open_last_resorts do |t|
      t.integer :lr_unveil_to, null: false
      t.boolean :lr_unveiled, default: false, null: false
      t.references :last_resort, null: false, foreign_key: true
      t.timestamps
    end
  end
end
