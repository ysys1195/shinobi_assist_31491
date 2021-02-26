class OpenLastResort < ApplicationRecord
  with_options presence: true do
    validates :open_to
    validates :opened
  end

  belongs_to :last_resort
end
