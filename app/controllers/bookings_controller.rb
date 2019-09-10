class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
    @pet = @booking.pet
    @owner = @pet.user
  end

  def new
    @pet = Pet.find(params[:pet_id])
    @owner = @pet.user
    @start_date = Date.new(params[:dates]["starts_at(1i)"].to_i, params[:dates]["starts_at(2i)"].to_i, params[:dates]["starts_at(3i)"].to_i)
    @end_date = Date.new(params[:dates]["ends_at(1i)"].to_i, params[:dates]["ends_at(2i)"].to_i, params[:dates]["ends_at(3i)"].to_i)
    @days = (@end_date - @start_date)
    @cost = ((@pet.price/7.0) * @days).round(2)
    @booking = Booking.new
  end

  def create
    booking = Booking.new(permit_params)
    pet = Pet.find(params[:pet_id])
    booking.pet = pet
    booking.user = current_user

    if booking.save
      redirect_to booking_path(booking)
    else
      render :new
    end
  end

  private

  def permit_params
    params.require(:booking).permit(:cost, :starts_at, :ends_at)
  end
end
