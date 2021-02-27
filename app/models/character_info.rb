class CharacterInfo
  include ActiveModel::Model
  attr_accessor :character_name, :pc_number, :secret_n, :secret, :last_resort_n, :last_resort

  with_options presence: true do
    validates :character_name
    validates :pc_number
    validates :secret_n
    validates :secret
    validates :last_resort_n
    validates :last_resort
  end

  def save
    room = Room.find_by(token: params[:room_token])
    character = Character.create(character_name: character_name, pc_number: pc_number, room_id: room.id)
    Secret.create(secret_n: secret_n, secret: secret, character_id: character.id)
    LastResort.create(last_resort_n: last_resort_n, last_resort: last_resort, character_id: character.id)
  end
end