class User < ApplicationRecord
	has_secure_password
	validates :email, presence: true, uniqueness: true, :on => :create
	validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
	validates :fullname, presence: true, :on => :create
	validates :username, presence: true, uniqueness: true, :on => :create
	validates :password, presence: true, length: { minimum: 6 }, :on => :create
end
