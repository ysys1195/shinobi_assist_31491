class Feeling < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :feel

  validates :feeling_to
  validates :feel_id, numericality: { other_than: 1 }
end
