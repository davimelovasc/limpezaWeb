class Api::V1::SpotsController < ApplicationController
  before_action :set_spot, only: [:show, :update, :destroy]

  # GET /spots
  def index
    @spots = Spot.all
    render json: @spots
  end

  # POST /spots
  def create
    @spot = Spot.new(spot_params)
    # @spot.user == current_user
    if @spot.save
      render json: @spot, status: :created
    else
      render json: @spot.errors, status: :unprocessable_entity
    end
  end

  # GET /spots/:id
  def show
    render json: @spot
  end

  # PUT /spots/:id
  def update
    @spot.update(spot_params)
    head :no_content
  end

  # DELETE /spots/:id
  def destroy
    @spot.destroy
    head :no_content
  end

  private

  def spot_params
    # whitelist params
    params.require(:spot).permit(:name, :clean_type, :governance, :lat, :long, :status, :user_id)
  end

  def set_spot
    @spot = Spot.find(params[:id])
  end
  
end


# http://localhost:3000/api/v1/spots
# {
# 	"spot": {
# 		"name": "Armazem",
# 		"clean_type": 1,
# 		"governance": "governo ce",
# 		"lat": "1234",
# 		"long": "1234",
# 		"status": 2,
# 		"user_id": 1
		
# 	}
# }