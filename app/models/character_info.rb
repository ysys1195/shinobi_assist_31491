class CharacterInfo
  include ActiveModel::Model
  attr_accessor :character_name, :pc_number, :secret_n, :secret, :last_resort_n, :last_resort
  #  :secret_unveil_to, :lr_unveil_to, :secret_unveiled, :lr_unveiled

  with_options presence: true do
    validates :character_name
    validates :pc_number
    validates :secret_n
    validates :secret
    validates :last_resort_n
    validates :last_resort
  end

  def save(room)
    character = Character.create(character_name: character_name, pc_number: pc_number, room_id: room.id)
    open_sec = Secret.create(secret_n: secret_n, secret: secret, character_id: character.id)
    open_lr = LastResort.create(last_resort_n: last_resort_n, last_resort: last_resort, character_id: character.id)
    room.player_number.times do |n|
      if character.pc_number != n + 1
        OpenSecret.create(secret_unveil_to: n + 1, unveiled_id: 1, secret_id: open_sec.id)
        OpenLastResort.create(lr_unveil_to: n + 1, unveiled_id: 1, last_resort_id: open_lr.id)
      end
    end
  end
end
