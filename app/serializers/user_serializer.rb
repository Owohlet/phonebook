class UserSerializer < ActiveModel::Serializer
	attributes :id, :email, :fullname, :username
end
