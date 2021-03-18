class EnterRoom
  include ActiveModel::Model
  attr_accessor :role, :token, :password, :user_id

  with_options presence: true do
    validates :role, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 8 }
    validates :token
    validates :password, length: { minimum: 4 }
  end

  def save(room)
    Role.create(role: role, user_id: user_id, room_id: room.id)
  end
end
