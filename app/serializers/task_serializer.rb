class TaskSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :period
  has_many :task_has_spots
end
