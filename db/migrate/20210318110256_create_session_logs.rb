class CreateSessionLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :session_logs do |t|
      t.string :title, null: false
      t.text :log, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
