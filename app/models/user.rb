class User < ApplicationRecord
  validates :username, :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}
  validates_presence_of :password_digest

  has_secure_password
  has_many :reviews
end
