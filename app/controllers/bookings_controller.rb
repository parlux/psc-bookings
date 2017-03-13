class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @presenter = BookingsPresenter.new
  end

  def create
    booking = Booking.new
    booking.room = params.dig(:booking, :room).to_i
    booking.session_time = params.dig(:booking, :session_time).to_i
    year = params[:booking]["session_date(1i)"].to_i
    month = params[:booking]["session_date(2i)"].to_i
    date = params[:booking]["session_date(3i)"].to_i
    booking.session_date = Date.new year, month, date
    booking.user = current_user
    booking.save

    redirect_to booking_path(booking)
  end

  def show
    @booking = Booking.find(params[:id])
  end
end
