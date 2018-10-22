class TasksController < WebController
  before_action :authenticate_admin!
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :set_spots, only: [:new, :edit]

  def index
    @tasks = Task.all
  end

  # GET
  def new
    @task = Task.new
    @spots = Spot.all
  end

  # POST
  def create
    @task = Task.new(task_params)
    params[:spot_ids] = params[:spot_ids].map(&:to_i)
    params[:spot_ids].each do |s|
      @task.spots << Spot.find(s)
    end
    if @task.save
      redirect_to tasks_path, notice: "Tarefa criada com sucesso!"
    else
      render 'new'
    end
  end

  def edit

  end


  # PUT
  def update
    if @task.update(task_params)
      params[:spot_ids] = params[:spot_ids].map(&:to_i)
      params[:spot_ids].each do |s|
        spot = Spot.find(s)
        @task.spots << spot unless @task.spots.exists?(spot.id)
      end
      redirect_to tasks_path, notice: "Tarefa atualizada com sucesso!"
    else
      render 'edit'
    end
  end


  def destroy
    if @task.spots.count < 1 && @task.destroy
      redirect_to tasks_path, notice: "Tarefa excluída com sucesso"
    else
      redirect_to tasks_path, notice: "Não foi possível excluir essa tarefa"
    end
  end



  private
  def task_params
    params.require(:task).permit(:name, :description)
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def set_spots
    @spots = Spot.all
  end



end
