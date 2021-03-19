class SessionLog < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :log
  end
  belongs_to :user
  belongs_to :room, optional: true
end