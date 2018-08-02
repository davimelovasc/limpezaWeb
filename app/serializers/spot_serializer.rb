class SpotSerializer < ActiveModel::Serializer
  attributes :id, :name, :clean_type, :governance, :lat, :long, :status
  has_many :task_has_spots
  has_one :user

end
