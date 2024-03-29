class User < ActiveRecord::Base
  validates(:name, presence: true, length: {maximum: 50})
  validates(:email,presence: true)
  validates :password, length: { minimum: 6 }
   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },  uniqueness: true
   
   before_save { self.email = email.downcase }
   has_secure_password
end
