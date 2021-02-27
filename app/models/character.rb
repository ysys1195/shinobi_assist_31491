class Character < ApplicationRecord
  belongs_to :room
  has_many :feelings, dependent: :destroy
  has_many :conditions, dependent: :destroy
end
