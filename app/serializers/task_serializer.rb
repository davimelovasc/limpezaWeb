class TaskSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :period, :details
end
