class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :registration, :email, :role
end
