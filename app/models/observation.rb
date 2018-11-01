class Observation < ApplicationRecord
  belongs_to :task_has_spot

  #validates :photo, :description, presence: true
end
