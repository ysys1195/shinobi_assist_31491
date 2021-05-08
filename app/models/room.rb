require 'securerandom'

class Room < ApplicationRecord
  before_create :create_token

  with_options presence: true do
    validates :room_name
    validates :player_number, numericality: { greater_than_or_equal_to: 2, less_than_or_equal_to: 8 }
  end
  # validates :password, length: { minimum: 4 }
  belongs_to :user
  has_many :characters, dependent: :destroy
  has_many :roles, dependent: :destroy
  has_secure_password

  def self.gm_role(room)
    Role.create(role: 200, user_id: room.user_id, room_id: room.id)
  end

  private

  def create_token
    self.token = SecureRandom.urlsafe_base64
  end
end
