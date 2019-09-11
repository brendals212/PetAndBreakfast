class DashboardController < ApplicationController
  def profile
    @user = User.find(params[:id])
    @pets = @user.pets
  end
end
