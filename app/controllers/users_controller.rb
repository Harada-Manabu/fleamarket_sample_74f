class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    redirect_to root_path unless user_signed_in? && current_user.id ==@user.id  
  end
  def logout
    @user = User.find_by(params[:user_id])
  end

end
