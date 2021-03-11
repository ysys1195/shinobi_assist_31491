class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  validates :name, presence: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, format: { with: PASSWORD_REGEX }

  has_many :rooms
  has_many :roles

  def self.guest
    # 10.times do |num|
    #   user = User.find_by(name: "guest#{num + 1}", email: "guest#{num + 1}@shinobininja.com")
    #   if user == nil
    #     return User.create(name: "guest#{num + 1}", email: "guest#{num + 1}@shinobininja.com", password: SecureRandom.alphanumeric(10) + '2b')
    #   end
    # end
    User.where('email LIKE(?)', '%@shinobininja.com').order(:current_sign_in_at).first
  end
end
