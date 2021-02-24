class Feeling < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :feel

  belongs_to :character, optional: true

  with_options presence: true do
    validates :feeling_to
    validates :feel_id, numericality: { other_than: 1 }
  end
end
