class PetsController < ApplicationController
  before_action :find, only: [:show, :edit, :update, :destroy]
  before_action :if_theres_photo, only: [:show, :edit, :update, :destroy]
  def index
    raise
    @pets = Pet.all
    @users = User.geocoded
    @markers = []
    @users.each do |user|
      if user.pets.empty?
        next
      else
        @markers << {
          lat: user.latitude,
          lng: user.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { user: user })
        }
      end
    end
    # raise
  end

  def new
    @pet = Pet.new
  end

  def create
    #users\:id\pets
    @pet = Pet.new(set_params)
    @pet.user = current_user
    if @pet.save
      redirect_to pet_path(@pet)
    else
      render :new
    end
  end

  def show
    @booking = Booking.new
  end

  def edit
  end

  def update
    if @pet.update(set_params)
      redirect_to pet_path(@pet)
    else
      render :new
    end
  end

  def destroy
    @pet.destroy
    redirect_to pets_path
  end

  private

  def find
    @pet = Pet.find(params[:id])
  end

  def set_params
    params.require(:pet).permit(:user_id, :name, :picture, :age, :name, :type, :breed, :color, :description, :needs, :location, :photo, :pet_type, :price)
  end

  def if_theres_photo
    if @pet.photo.nil?
      @pet.photo = "https://tevrapet.com/wp-content/uploads/2017/02/AdobeStock_109191236.jpeg"
    end
  end
end
