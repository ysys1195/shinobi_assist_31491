class Secret < ApplicationRecord

  belongs_to :character
  has_many :open_secrets
end
