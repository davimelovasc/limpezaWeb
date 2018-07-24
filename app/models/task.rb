class Task < ApplicationRecord
  acts_as_paranoid
  has_many :task_has_spot
  has_many :spots, through: :task_has_spot
end
