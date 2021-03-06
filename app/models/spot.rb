class Spot < ApplicationRecord
  acts_as_paranoid
  belongs_to :user, optional: true
  has_many :task_has_spots
  has_many :tasks, through: :task_has_spots
  accepts_nested_attributes_for :task_has_spots
  has_attached_file :photo, source_file_options: { all: '-auto-orient' } #, styles: { large: "900x"}
  validates_attachment_content_type :photo, content_type: ["image/jpeg", "image/png"]
  validate :check_days_repetitions
  validates :name, :lat, :long, :status, presence: true

  before_validation :edit_arrays
  

  def edit_arrays
    unless(self.light_cleaning.blank?)
      self.light_cleaning.remove! "["
      self.light_cleaning.remove! "]"
      self.light_cleaning.gsub! /"/, ''
      self.light_cleaning.gsub! /\s+/, ""
    end

    unless(self.heavy_cleaning.blank?)
      self.heavy_cleaning.remove! "["
      self.heavy_cleaning.remove! "]"
      self.heavy_cleaning.gsub! /"/, ''
      self.heavy_cleaning.gsub! /\s+/, ""
    end

  end
  #  enum status: { to_do: 0, pendent: 1, completed: 2, need_review: 3  }

  def status_name
    case self.status.to_i
    when 0
      "A fazer"
    when 1
      "Pendente"
    when 2
      "Feito"
    when 3
      "Revisão necessária"
    end
  end

  def name_of_days(days)
    days = days.split(",")
    days_string = ""
    days.each do |d|
      case d.to_i
      when 2
        days_string.concat("Segunda, ")
      when 3
        days_string.concat("Terça, ")
      when 4
        days_string.concat("Quarta, ")
      when 5
        days_string.concat("Quinta, ")
      when 6
        days_string.concat("Sexta, ")
      when 7
        days_string.concat("Sábado, ")
      when 1
        days_string.concat("Domingo, ")
      end
    end

    days_string.delete_suffix!(", ")
  end

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


  def is_pendent #return true se Completou todas as tarefas. Esperando avaliação
    self.tasks do |task|
      ts = TaskHasSpot.find_by(task: task, spot: self)

      if ts.status == 1
      elsif ts.status != 1
        return false; #nao fez tudo ou need_review
      end

    end
    return true;
  end

  def check_days_repetitions
    heavy_cleaning = self.heavy_cleaning.split(",").map(&:to_i)
    light_cleaning = self.light_cleaning.split(",").map(&:to_i)
    heavy_cleaning.each do |heavy_day|
      if light_cleaning.include?(heavy_day)
        errors.add(:base, "Dias de limpeza leve e pesada não podem se repetir.")
        return
      end
    end
    
  end

end
