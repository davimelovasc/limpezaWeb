class SpotsController < ApplicationController
  before_action :set_task, only: [:update]

  # POST
  def create
    @spot = Spot.new(spot_params)
    # break if @spot.user != current_user
    if @spot.save

    else

    end
  end

  # PUT        before_action set_spot
  def update
    if @task.update(task_params)

    else

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
