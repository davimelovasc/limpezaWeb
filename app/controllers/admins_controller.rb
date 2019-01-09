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
    if @admin.password != @admin.password_confirmation
      flash[:alert] = "Senha e confirmação de senha não estão iguais."
      render 'new'
    elsif @admin.save
        redirect_to admins_path, notice: "Administrador criado com sucesso!"
    else
      flash[:alert] = "Ocorreram os seguintes erros: #{@admin.errors}"
      render 'new'
    end
  end

  def edit
  end


  def update
    if @admin.update_with_password(admin_params)
      sign_in(current_admin, bypass: true)
      redirect_to admins_path, notice: "Administrador atualizado com sucesso."
    else
      flash[:alert] = "Ocorreram os seguintes erros: #{@admin.errors.full_messages}"
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

  def edit_profile
    @admin = current_admin
  end


  private
  def admin_params
    params.require(:admin).permit(:email, :name, :current_password, :password, :password_confirmation)
  end

  def set_admin
    @admin = Admin.find(params[:id])
  end

end
