class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable

  validates :name, presence: true


  def abr_name
    name = self.name.split(" ")
    name.length > 1? name[0] + " " + name[-1] : self.name
  end
end
