class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :room_name, null: false
      t.integer :player_number, null: false
      t.string :password_digest
      t.references :user, null: false
      t.timestamps
    end
  end
end
