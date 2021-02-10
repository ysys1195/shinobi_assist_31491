class AddTokenToRooms < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :token, :string
  end
end
