class OpenSecret < ApplicationRecord
  with_options presence: true do
    validates :secret_unveil_to
    validates :secret_unveiled
  end

  belongs_to :secret
end
