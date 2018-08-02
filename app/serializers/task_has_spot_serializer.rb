class TaskHasSpotSerializer < ActiveModel::Serializer
  attribute :id
  has_one :task
  has_one :detail
  has_one :observation

  def detail
    Detail.where(task_has_spot_id: object.id, created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day ).last
  end

  def observation
    Observation.where(task_has_spot_id: object.id, created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day ).last
  end

end
