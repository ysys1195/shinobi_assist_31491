class Room < ApplicationRecord
  with_options presence: true do
    validates :room_name
    validates :player_number
  end
  has_many :user
  has_secure_password
end
