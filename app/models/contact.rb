class Contact < ApplicationRecord
	has_many :histories, dependent: :destroy
	validates :email, presence: true, uniqueness: true
	validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :created_by, presence: true
	validates :phone_number, presence: true





end
