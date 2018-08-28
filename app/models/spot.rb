class Spot < ApplicationRecord
  acts_as_paranoid
  belongs_to :user, optional: true
  has_many :task_has_spots
  has_many :tasks, through: :task_has_spots

  #  enum status: { to_do: 0, pendent: 1, completed: 2, need_review: 3  }

  def as_json(options = {})
    super(
      include: {
        tasks: {
          except: [:created_at, :updated_at, :deleted_at],
          methods: [:details, :observations],
          root: true
        }
      },
      except: [:created_at, :updated_at, :deleted_at]
    )
  end



  def is_pendent #Completou todas as tarefas. Esperando avaliação
    self.tasks do |task|
      ts = TaskHasSpot.where(task: task, spot: self).first

      if ts.status == 1
      elsif ts.status != 1
        return false; #nao fez ou need_review
      end

    end
    return true;
  end

end
