class TaskHasSpot < ApplicationRecord
  has_many :details
  has_many :observations
  belongs_to :spot
  belongs_to :task
end
