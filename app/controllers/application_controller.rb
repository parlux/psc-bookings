class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  def check_privileges!
    redirect_to root_path, notice: 'You dont have enough permissions to be here' unless current_user.admin?
  end
end
