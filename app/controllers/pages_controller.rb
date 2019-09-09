class PagesController < ApplicationController
  def home
    @pets = Pet.all
    # raise
  end
end
