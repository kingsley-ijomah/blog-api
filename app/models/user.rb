class User < ApplicationRecord
  has_secure_password
  validates :email, :password_digest, :firstname, :lastname, presence: true

  has_many :posts
end
