class Spot < ApplicationRecord
  acts_as_paranoid
  belongs_to :user, optional: true
  has_many :task_has_spots
  has_many :tasks, through: :task_has_spots

  enum status: { to_do: 0, pendent: 1, completed: 2, need_review: 3  }
end
