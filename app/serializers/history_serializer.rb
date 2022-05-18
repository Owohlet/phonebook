class HistorySerializer < ActiveModel::Serializer
	attributes :id, :first_name, :last_name, :email, :phone_number, :updated_by, :created_at

	belongs_to :contact
end
