class TaskHasSpotSerializer < ActiveModel::Serializer
  attributes :id, :detail


  def detail
    Detail.where(task_has_spot_id: object.id, created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day ).last
  end
  
end
