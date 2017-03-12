module Admin
  class DashboardController < ApplicationController
    def index
      @current_user = current_user.email
    end
  end
end
