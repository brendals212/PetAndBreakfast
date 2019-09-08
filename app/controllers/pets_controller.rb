class PetsController < ApplicationController
  before_action :find, only: [:show, :edit, :update, :destroy]

  def index
    @pets = Pet.all
  end

  def new
    @pet = Pet.new
  end

  def create
    #users\:id\pets
    @pet = Pet.new(set_params)
    @pet.user = current_user[:id]
    if @pet.save
      redirect to pet_path(@pet)
    else
      render :new
    end
  end

  def show
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
    params.require(:pet).permit(:user_id, :name, :picture, :age, :name, :type, :breed, :color, :description, :needs)
  end
end
