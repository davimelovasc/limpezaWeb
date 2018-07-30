class Api::V1::SpotsController < Api::V1::ApiController
  #before_action :authenticate_api_v1_user
  before_action :set_spot, only: [:show, :update, :destroy]

  # GET /spots
  def index
    # if current_api_v1_user.supervisor?
      @spots = Spot.all
    # else
    #   @spots = Spot.where(user: current_api_v1_user)
    # end
    render json: @spots, include: "*.*", root: "data"
  end

  # PUT /spots/:id { "status": 0 }
  def update
    if @spot.update(spot_params)
      render json: @spot, status: :ok
    else
      render json: { error: @spot.errors }, status: :unprocessable_entity
    end
  end

  # PUT /spots/:id
  # def update
  #   if @spot.update(task_params)
  #     render json: @spot, status: :ok
  #   else
  #     render json: { error: @spot.errors }, status: :unprocessable_entity
  #   end
  # end

  # DELETE /spots/:id     before_action set_spot
  # def destroy
  #   if @spot.destroy
  #     render json: {}, status: :ok
  #   else
  #     render json: { erro: @spot.errors }, status: :unprocessable_entity
  #   end
  # end

  private

  def spot_params
    params.permit(:status)
  end

  def set_spot
    @spot = Spot.find(params[:id])
  end

end
