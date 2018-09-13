class SpotsController < WebController
  before_action :authenticate_admin!
  before_action :set_task, only: [:update]

  def index
    @spots = Spot.all
  end

  # GET
  def new
    @spot = Spot.new
  end

  # POST
  def create
    @spot = Spot.new(spot_params)
    # break if @spot.user != current_user
    if @spot.save
      redirect_to #
    else
      render 'new'
    end
  end

  # PUT
  # before_action set_spot
  def update
    if @task.update(task_params)
      redirect_to #
    else
      render
    end
  end



  private
  def spot_params
    params.require(:spot).permit(:name, :clean_type, :governance, :lat, :long, :status, :user_id)
  end

  def set_task
    @task = Task.find(params[:id])
  end

end
