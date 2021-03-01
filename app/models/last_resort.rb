class LastResort < ApplicationRecord
  with_options presence: true do
    validates :last_resort_n
    validates :last_resort
  end

  belongs_to :character
  has_many :open_last_resorts
end
