class AdminsController < WebController
  before_action :authenticate_admin!
  before_action :set_admin, only: [:show, :edit, :update, :destroy]


  def index
    @admins = Admin.all
  end


  def new
    @admin = Admin.new
  end


  def create
    @admin = Admin.new(admin_params)
    byebug
    if @admin.save
      redirect_to admins_path, notice: "Administrador criado com sucesso!"
    else
      flash[:alert] = "Ocorreram os seguintes erros: #{@admin.errors}"
      render 'new'
    end
  end

  def edit
  end


  def update
    if @admin.update(admin_params)
      redirect_to admins_path, notice: "Administrador atualizado com sucesso."
    else
      flash[:alert] = "Ocorreram os seguintes erros: #{@admin.errors}"
      set_admin
      render "edit"
    end
  end


  def destroy
    if @admin.destroy
      redirect_to admins_path, notice: "Administrador excluído com sucesso"
    else
      redirect_to admins_path, notice: "Não foi possível excluir esse administrador"
    end
  end


  private
  def admin_params
    params.require(:admin).permit(:email, :name, :password, :password_confirmation)
  end

  def set_admin
    @admin = Admin.find(params[:id])
  end

end
