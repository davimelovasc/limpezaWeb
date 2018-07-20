class Api::V1::SpotsController < ApplicationController
  before_action :set_spot, only: [:show, :update, :destroy]

  # GET /spots
  def index
    @spots = Spot.all
    render :json => @spots
  end

  # POST /spots
  def create
    @spot = Spot.create!(spot_params)
    json_response(@spot, :created)
  end

  # GET /spots/:id
  def show
    json_response(@spot)
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
    params.permit(:name)
  end

  def set_spot
    @spot = Spot.find(params[:id])
  end
end
