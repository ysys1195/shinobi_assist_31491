class CreateOpenSecrets < ActiveRecord::Migration[6.0]
  def change
    create_table :open_secrets do |t|
      t.integer :secret_unveil_to, null: false
      t.integer :unveiled_id, null: false
      t.references :secret, null: false, foreign_key: true
      t.timestamps
    end
  end
end
