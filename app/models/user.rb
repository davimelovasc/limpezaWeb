class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable
  include DeviseTokenAuth::Concerns::User

  enum role: { caretaker: 0, supervisor: 1 }

  # def token_validation_response
  #   UserSerializer.root = false
  #   UserSerializer.new(self).as_json
  # end

  def as_json(options = {})
    super(methods: [:spots],
          except: [:created_at, :updated_at] )
  end

  def spots
    SpotService.getSpots(self.id)
  end


end
