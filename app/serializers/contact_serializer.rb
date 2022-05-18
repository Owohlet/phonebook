class ContactSerializer < ActiveModel::Serializer
	attributes :id, :first_name, :last_name, :email, :phone_number, :created_by

	has_many :histories
end
