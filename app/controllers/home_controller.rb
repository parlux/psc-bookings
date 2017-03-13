class HomeController < ApplicationController
  def index
    if current_user.admin?
      redirect_to admin_path
    elsif current_user.student?
      redirect_to new_booking_path
    else
      render plain: "We should't be here..."
    end
  end
end
