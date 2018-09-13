class TasksController < WebController
  before_action :authenticate_admin!

  def index
    @tasks = Task.all
  end

  


end
