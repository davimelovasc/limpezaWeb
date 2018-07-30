class TaskHasSpotSerializer < ActiveModel::Serializer
  has_many :details
  has_many :observations
end
