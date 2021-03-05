class OpenLastResort < ApplicationRecord
  with_options presence: true do
    validates :lr_unveil_to
    validates :lr_unveiled
  end

  belongs_to :last_resort
end
