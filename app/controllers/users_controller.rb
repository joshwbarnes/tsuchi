class UsersController < ApplicationController
  def update
    @user = current_user
    @user.update(user_params)
redirect_to request.referer
  end
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :mobile_number, :address)
  end
end
