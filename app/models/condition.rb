class Condition < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :state

  belongs_to :character

  validates :state_id, numericality: { other_than: 1 }
end
