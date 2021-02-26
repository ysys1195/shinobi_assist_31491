class Secret < ApplicationRecord
  with_options presence: true do
    validates :secret_n
    validates :secret
  end

  belongs_to :character
  has_many :open_secrets
end
