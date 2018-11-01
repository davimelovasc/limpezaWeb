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
    @spots = Spot.where(user: nil).or(Spot.where(user: @user))
  end


  # PUT
  def update
    if params[:spot_ids]
      params[:spot_ids].each do |spot_id|
        s = Spot.find(spot_id)
        s.user = @user
        s.save
      end
    end
    if @user.update(user_params)
      redirect_to users_path, notice: "Usuário atualizado com sucesso."
    else
      flash[:alert] = "Ocorreram os seguintes erros: " + @user.errors
      set_user
      render "edit"
    end
  end


  def destroy
    if @user.destroy
      redirect_to users_path, notice: "Usuário excluído com sucesso"
    else
      redirect_to users_path, notice: "Não foi possível excluir esse usuário"
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
