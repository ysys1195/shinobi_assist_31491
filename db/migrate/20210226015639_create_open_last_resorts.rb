class CreateOpenLastResorts < ActiveRecord::Migration[6.0]
  def change
    create_table :open_last_resorts do |t|
      t.string :open_to, null: false
      t.boolean :opened, null: false
      t.references :last_resort, null: false, foreign_key: true
      t.timestamps
    end
  end
end
