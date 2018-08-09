class Api::V1::SpotsController < Api::V1::ApiController
  before_action :authenticate_api_v1_user!
  before_action :set_spot, only: [:show, :update, :destroy]

  # GET /spots
  def index
    @spots = SpotService.getSpots(current_api_v1_user.id)
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


  # zelador / supervisor so vai chamar se tiver observacao
  # POST /complete_spot/:spot_id
  def complete_spot
    if current_api_v1_user.caretaker?
     complete_params.each do |p|
       d = Detail.new(task_has_spot_id: p[:task_has_spot_id], photo: p[:photo], description: p[:description])
      if not d.save
        render json: { error: d.errors }, status: :unprocessable_entity
      end
    end

  else #supervisor

    obs_params.each do |p|
      o = Observation.new(task_has_spot_id: p[:task_has_spot_id], description: p[:description], photo: p[:photo])
      if not o.save
        render json: { error: d.errors }, status: :unprocessable_entity
      end
    end

  end
    render json:{}, status: :ok
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

  def complete_params
    params.require(:details)
  end

  def obs_params
    params.require(:observations)
  end

end
