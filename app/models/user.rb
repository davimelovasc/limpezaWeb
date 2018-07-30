class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable
  include DeviseTokenAuth::Concerns::User

  enum role: { caretaker: 0, supervisor: 1 }
end
