class Task < ApplicationRecord
  acts_as_paranoid
  has_many :task_has_spots
  has_many :spots, through: :task_has_spots

  validates :name, :description, presence: true

  def details
    Detail.where(task_has_spot_id: self.task_has_spots.ids, created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day ).as_json(except: [:task_has_spot_id, :created_at, :updated_at])
  end

  def observations
    Observation.where(task_has_spot_id: self.task_has_spots.ids, created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day ).as_json(except: [:task_has_spot_id, :created_at, :updated_at])
  end

  def status(spot_id)
    ts = TaskHasSpot.where(task_id: self.id ,spot_id: spot_id)
    ts.status
  end

end
