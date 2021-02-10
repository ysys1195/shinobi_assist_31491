class Room < ApplicationRecord
  with_options presence: true do
    validates :room_name
    validates :player_number, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 6 }
  end
  validates :password, length: { minimum: 4 }
  has_many :user
  has_secure_password
end
