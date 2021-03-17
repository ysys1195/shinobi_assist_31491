class LastResort < ApplicationRecord
  with_options presence: true do
    validates :last_resort_n
    validates :last_resort
  end

  belongs_to :character
  has_many :open_last_resorts, dependent: :destroy

  def self.create_open_lrs(room, lr_id, character)
    room.times do |n|
      OpenLastResort.create(lr_unveil_to: n + 1, unveiled_id: 1, last_resort_id: lr_id) if character.pc_number != n + 1
    end
  end
end
