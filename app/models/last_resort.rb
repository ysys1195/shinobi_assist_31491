class LastResort < ApplicationRecord
  
  belongs_to :character
  has_many :open_last_resorts
end
