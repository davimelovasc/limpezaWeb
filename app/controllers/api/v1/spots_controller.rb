class Api::V1::SpotsController < Api::V1::ApiController
  before_action :authenticate_api_v1_user!
  before_action :set_spot, only: [:show, :update, :destroy]

  # GET /spots
  def index
    @spots = SpotService.getSpots(current_api_v1_user.id)
    render json: @spots
  end

  # PUT /spots { "id": 1, "status": 0 }
  def update
    if @spot.update(spot_params)
      render json: @spot, status: :ok
    else
      render json: { error: @spot.errors }, status: :unprocessable_entity
    end
  end


  # zelador / supervisor so vai chamar se tiver observacao
  # POST /spots
  def complete_spot
    begin
      spot = Spot.find(params[:spot_id])
      if current_api_v1_user.caretaker?
        complete_params.each do |p|
          task = Task.find(p[:task_id])
          ts = TaskHasSpot.where(spot: spot, task: task).first
          d = Detail.new(task_has_spot: ts, photo: p[:photo], description: p[:description])
          ts.status = 1  # pendent
          d.save
          ts.save
        end

        if spot.is_pendent
          spot.status = 1 # pendent
          spot.save
        end

      else #supervisor
        obs_params.each do |p|
          task = Task.find(p[:task_id])
          ts = TaskHasSpot.where(spot: spot, task: task).first
          o = Observation.new(task_has_spot: ts, description: p[:description], photo: p[:photo])
          ts.status = 3
          o.save
          ts.save
        end

        spot.status = 3
        spot.save
      end
      render json: SpotService.getSpots(current_api_v1_user.id), status: :ok
    rescue => e
      render json: {error: e}, status: :unprocessable_entity
    end
  end


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
