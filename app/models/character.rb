class Character < ApplicationRecord
  belongs_to :room
  has_many :secret, dependent: :destroy
  has_many :last_resort, dependent: :destroy
  has_many :feelings, dependent: :destroy
  has_many :conditions, dependent: :destroy

  with_options presence: true do
    validates :character_name
    validates :pc_number
  end
end
