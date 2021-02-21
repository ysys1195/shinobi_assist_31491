class Character < ApplicationRecord
  with_options presence: true do
    validates :character_name
    validates :pc_number
  end
  validate :secret
  validate :last_resort
  
  belongs_to :room
  has_many :feelings
  has_many :conditions
end
