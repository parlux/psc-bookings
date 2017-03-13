module Admin
  class DashboardController < ApplicationController
    before_action :check_privileges!, only: [:index]

    def index
      @bookings = Booking.all.order(session_date: :desc)
    end
  end
end
