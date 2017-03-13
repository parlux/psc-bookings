module Admin
  class DashboardController < ApplicationController
    def index
      if !current_user.admin?
        redirect_to root_path and return
      end

      @bookings = Booking.all.order(session_date: :desc)

    end
  end
end
