class HomeController < ApplicationController
  def index
    if current_user.admin?
      redirect_to admin_path
    elsif current_user.user?
      redirect_to bookings_path
    else
      render plain: "We should't be here..."
    end
  end
end
