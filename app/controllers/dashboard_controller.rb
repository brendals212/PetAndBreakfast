class DashboardController < ApplicationController
  def profile
    if current_user.nil?
      redirect_to root_path
    else
      @user = current_user
      @pets = current_user.pets
    end
  end
end
