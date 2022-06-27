class Api::V1::UsersController < Api::V1::BaseController
  before_action :set_user

  def unpdate
    if @user.update(user_params)
      api_success
    else
      api_error
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:nickname, :avatarUrl)
  end
end
