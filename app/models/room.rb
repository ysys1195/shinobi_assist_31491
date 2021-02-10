require 'securerandom'

class Room < ApplicationRecord
before_create :create_token

  with_options presence: true do
    validates :room_name
    validates :player_number, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 6 }
  end
  validates :password, length: { minimum: 4 }
  has_many :user
  has_secure_password

  private

  def create_token
    self.token = SecureRandom.urlsafe_base64
  end
end
