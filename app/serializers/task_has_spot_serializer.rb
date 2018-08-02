class TaskHasSpotSerializer < ActiveModel::Serializer
  attribute :id
  has_one :task
  has_many :details
  has_many :observations

  def details
    Detail.where(task_has_spot_id: object.id, created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day )
  end

  def observations
    Observation.where(task_has_spot_id: object.id, created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day )
  end

end
