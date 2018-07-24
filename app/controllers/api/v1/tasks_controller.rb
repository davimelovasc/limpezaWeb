class Api::V1::TasksController < Api::V1::ApiController
  # before_action :authenticate_user!
  before_action :set_task, only: [:show, :update, :destroy]

  # GET /tasks
  def index
    @tasks = Task.all
    render :json => @tasks
  end

  # POST /tasks
  # def create
  #   @task = Task.new(task_params)
  #   if @task.save
  #     render json: @task, status: :created
  #   else
  #     render json: @task.errors, status: :unprocessable_entity
  #   end
  # end

  # GET /tasks/:id        before_action set_spot
  def show
    render json: @task
  end

  # PUT /tasks/:id        before_action set_spot
  def update
    if @task.update(task_params)
      render json: @task, status: :ok
    else
      render json: { error: @task.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /tasks/:id     before_action set_spot
  def destroy
    if @task.destroy
      render json: {}, status: :ok
    else
      render json: { erro: @task.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :period)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
