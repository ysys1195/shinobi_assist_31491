class CreateOpenSecrets < ActiveRecord::Migration[6.0]
  def change
    create_table :open_secrets do |t|
      t.string :open_to, null: false
      t.boolean :opened, null: false
      t.references :secret, null: false, foreign_key: true
      t.timestamps
    end
  end
end
