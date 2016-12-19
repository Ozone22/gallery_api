class User < ApplicationRecord
  before_save { email.downcase! }

  has_many :wallpapers, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :email, presence: true, email: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { in: 5..100 }
  validates :full_name, presence: true

  has_secure_password
end
