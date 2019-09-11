require 'date'
class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
    @pet = @booking.pet
    @owner = @pet.user
    @date = DateTime.now
  end

  def new
    @pet = Pet.find(params[:pet_id])
    @owner = @pet.user
    @start_date = Date.new(params[:dates][:starts_at][0..3].to_i, params[:dates][:starts_at][5..6].to_i, params[:dates][:starts_at][8..9].to_i)
    @end_date = Date.new(params[:dates][:starts_at][14..17].to_i, params[:dates][:starts_at][19..20].to_i, params[:dates][:starts_at][22..23].to_i)
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

  def update
    booking = Booking.find(params[:id])
    booking.update(review: permit_params[:review])
    redirect_to booking_path(booking)
  end

  private

  def permit_params
    params.require(:booking).permit(:cost, :starts_at, :ends_at, :review)
  end
end
