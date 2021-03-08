class OpenSecret < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :unveiled

  with_options presence: true do
    validates :secret_unveil_to
    validates :unveiled_id, inclusion: { in: [1, 2] }
  end

  belongs_to :secret
end
