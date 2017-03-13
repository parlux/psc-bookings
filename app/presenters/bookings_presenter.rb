class BookingsPresenter
  def options_for_session_times
    Booking.session_times
  end
end
