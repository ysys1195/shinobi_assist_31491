class Character < ApplicationRecord
  validates :character_name, presence: true
  validate :secret
  validate :last_resort
  
  belongs_to :room
  has_many :feelings
  has_many :conditions
end
