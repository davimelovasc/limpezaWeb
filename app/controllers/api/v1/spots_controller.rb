class Api::V1::SpotsController < Api::V1::ApiController
  # before_action :authenticate_user!
  before_action :set_spot, only: [:show, :update, :destroy]

  # GET /spots
  def index
    @spots = Spot.all
    render json: @spots
  end



  # GET /spots/:id        before_action set_spot
  def show
    render json: @spot
  end

  # PUT /spots/:id        before_action set_spot
  #
  def update
    if @spot.update(task_params)
      render json: @spot, status: :ok
    else
      render json: { error: @spot.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /spots/:id     before_action set_spot
  def destroy
    if @spot.destroy
      render json: {}, status: :ok
    else
      render json: { erro: @spot.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def spot_params
    params.require(:spot).permit(:name, :clean_type, :governance, :lat, :long, :status, :user_id)
  end

  def set_spot
    @spot = Spot.find(params[:id])
  end

end
