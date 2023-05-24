class Api::V1::UsersController < Api::V1::BaseController
  before_action :set_user

  def update
    if @user.update(user_params)
      api_success(message: '更新成功')
    else
      api_error(message: '更新失败')
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:nickname, :avatar_url, :gender)
  end
end
