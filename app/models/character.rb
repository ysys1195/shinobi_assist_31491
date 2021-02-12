class Character < ApplicationRecord
  validates :character_name, presence: true
  validates :secret
  validates :last_resort
  belongs_to :room
end
