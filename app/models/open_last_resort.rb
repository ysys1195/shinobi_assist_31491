class OpenLastResort < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :unveiled

  with_options presence: true do
    validates :lr_unveil_to
    validates :unveiled_id, inclusion: { in: [1, 2] }
  end

  belongs_to :last_resort
end
