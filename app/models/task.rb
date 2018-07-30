class Task < ApplicationRecord
  acts_as_paranoid
  has_many :task_has_spots
  has_many :spots, through: :task_has_spots
end
