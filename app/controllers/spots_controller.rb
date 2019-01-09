class SpotsController < WebController
  before_action :authenticate_admin!
  before_action :set_spot, only: [:show, :edit, :update, :destroy]
  before_action :set_tasks, only: [:new, :edit]

  def index
    @spots = Spot.all
  end

  # GET
  def new
    @caretakers = User.where(role: 0)
    @spot = Spot.new
  end

  # POST
  def create
    @spot = Spot.new(spot_params)
    if @spot.save
      redirect_to spots_path, notice: "Local criado com sucesso!"
    else
      redirect_to new_spot_path, alert: "Ocorreu(ram) o(s) seguinte(s) erro(s) #{@spot.errors.full_messages}"
    end
  end

  def edit
    @caretakers = User.where(role: 0)
  end


  # PUT
  def update
    if @spot.update(spot_params)
      redirect_to spots_path, notice: "#{@spot.name} editado com sucesso."
    else
      set_tasks
      @caretakers = User.where(role: 0)
      flash[:alert] = "Ocorreu(ram) o(s) seguinte(s) erro(s) #{@spot.errors.full_messages}"
      render 'edit'
    end
  end


  def destroy
    if @spot.destroy
      redirect_to spots_path, notice: "Local excluído com sucesso."
    else
      redirect_to spots_path, alert: "Não foi possível excluir o local."
    end
  end



  private
  def spot_params
    params.require(:spot).permit(:name, { light_cleaning: [] }, { task_ids: [] }, { heavy_cleaning: [] }, :governance, :lat, :long, :status, :user_id, :photo)
  end

  def set_spot
    @spot = Spot.find(params[:id])
  end

  def set_tasks
    @tasks = Task.all
  end

end
