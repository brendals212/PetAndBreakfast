class PetsController < ApplicationController
  before_action :find, only: [:show, :edit, :update, :destroy]
  before_action :if_theres_photo, only: [:show, :edit, :update, :destroy]

  def index
    # process input from search form

    if params[:location] && params[:animal]
      @pets = Pet.where("pet_type ILIKE?", "%#{params[:animal]}%").near(params[:location], 20)
    else
      @pets = Pet.all
    end

    @users = User.geocoded
    @markers = []
    @pets.where.not(latitude: nil, longitude: nil).each do |pet|
        @markers << {
          lat: pet.latitude,
          lng: pet.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { pet: pet })
        }
      end
  end

  def new
    @pet = Pet.new
  end

  def create
    #users\:id\pets
    @pet = Pet.new(set_params)
    @pet.user = current_user
    @pet.location = current_user.address
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
