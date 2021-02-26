class CreateSecrets < ActiveRecord::Migration[6.0]
  def change
    create_table :secrets do |t|
      t.integer :secret_n, null: false
      t.text :secret, null: false
      t.references :character, null: false, foreign_key: true
      t.timestamps
    end
  end
end
