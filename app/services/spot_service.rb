class SpotService

  def self.getSpots(id)
    return '' if id.nil?
    user = User.find(id)
    if user.supervisor?
      @spots = Spot.all
    else
      @spots = Spot.where(user: user)
    end
    return @spots
  end

end
