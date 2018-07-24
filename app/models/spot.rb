class Spot < ApplicationRecord
  acts_as_paranoid
  belongs_to :user, optional: true
  has_many :task_has_spot
  has_many :tasks, through: :task_has_spot
end
