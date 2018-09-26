class TasksController < WebController
  before_action :authenticate_admin!

  def autocomplete
    @tasks = Task.all
    tasks_json = []
    @tasks.each { |t|  tasks_json << {value: t.name, data: t.id}}

    render json: tasks_json
  end

  def index
    @tasks = Task.all
  end


end
