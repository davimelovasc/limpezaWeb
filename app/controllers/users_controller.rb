class UsersController < WebController
  before_action :authenticate_admin!
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  # GET
  def new
    @user = User.new
    @spots = Spot.where(user: nil)
  end

  # POST
  def create
    @user = User.new(user_params)
    spot_ids.each do |s|
      spot = Spot.find(s)
      spot.user = @user
      spot.save
    end
    if @user.save
      redirect_to users_path, notice: "Usuário criado com sucesso!"
    else
      render 'new'
    end
  end

  def edit

  end


  # PUT
  def update

  end


  def destroy
    if @user.destroy
      redirect_to tasks_path, notice: "Usuário excluído com sucesso"
    else
      redirect_to tasks_path, notice: "Não foi possível excluir esse usuário"
    end
  end



  private
  def user_params
    params.require(:user).permit(:name, :role, :registration, :email, :password, :password_confirmation)
  end

  def spot_ids
    params[:spot_ids]
  end

  def set_user
    @user = User.find(params[:id])
  end



end
