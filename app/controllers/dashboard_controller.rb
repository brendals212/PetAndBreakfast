class DashboardController < ApplicationController
  def profile
    @user = User.find(params[:id])
    @pets = @user.pets
  end

  def edit
    @user = current_user
    @pets = @user.pets
  end

  def update
    current_user.update(set_params)
    redirect_to profile_dashboard_path(current_user)
  end

  private

  def set_params
    params.require(:user).permit(:email, :description, :photo, :address)
  end
end
