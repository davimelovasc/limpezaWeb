class TasksController < ApplicationController
  before_action :authenticate_admin!

  def index
    @tasks = Task.all
  end

  


end
