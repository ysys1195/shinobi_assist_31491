class OpenSecret < ApplicationRecord
  with_options presence: true do
    validates :open_to
    validates :opened
  end

  belongs_to :secret
end
