class Secret < ApplicationRecord
  with_options presence: true do
    validates :secret_n
    validates :secret
  end

  belongs_to :character
  has_many :open_secrets, dependent: :destroy

  def self.create_open_secrets(room, secret_id, character)
    room.times do |n|
      OpenSecret.create(secret_unveil_to: n + 1, unveiled_id: 1, secret_id: secret_id) if character.pc_number != n + 1
    end
  end
end
