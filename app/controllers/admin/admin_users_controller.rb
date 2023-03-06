class Admin::AdminUsersController < Admin::BaseController
  before_action :set_admin_user, only: [:show, :destroy]

  def index
    @search = AdminUser.ransack(params[:q])
    scope = @search.result
    @admin_users = scope.sorted.page(params[:page])
  end

  def show
  end

  def new
    @admin_user = AdminUser.new
  end

  def edit
    @admin_user = User.find(params[:id])
  end

  def create
    @admin_user = AdminUser.new(admin_user_params)
    respond_to do |format|
      if @admin_user.save
        format.html { redirect_to admin_admin_users_path, notice: '系统管理员已增加。' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    @admin_user = User.find(params[:id])
    if @admin_user.type != 'AdminUser'
      @admin_user.becomes!(AdminUser)
      @admin_user.save
      @admin_user = AdminUser.find(params[:id])
    end
    respond_to do |format|
      admin_user_params.except!(:password, :password_confirmation) if admin_user_params[:password].blank?
      if @admin_user.update_attributes(admin_user_params)
        if !@admin_user.super_manager?
          @admin_user.manager!
        end
        format.html { redirect_to admin_admin_users_path, notice: '系统管理员信息已修改。' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @admin_user.becomes!(User)
    @admin_user.save
    respond_to do |format|
      format.html { redirect_to admin_admin_users_url, notice: '系统管理员已删除。' }
    end
  end

  private
    def set_admin_user
      @admin_user = AdminUser.find(params[:id])
    end

    def admin_user_params
      params[:admin_user][:permission] = params[:modules] if params[:modules].present?
      if params.require(:admin_user)[:password].blank?
        params.require(:admin_user).except(:password, :password_confirmation).permit!
      else
        params.require(:admin_user).permit!
      end
    end
end
