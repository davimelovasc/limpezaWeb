class SpotSerializer < ActiveModel::Serializer
  attributes :id, :name, :clean_type, :governance, :lat, :long, :status
  has_many :tasks
  has_one :user

end
