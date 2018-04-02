class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper #all controllers have helper access

  before_action :require_login, only: [:user, :session, :review, :restaurant] #filter prevernt unauth. access/use

  private
  def require_login #before action filter confirm logged-in user
    unless logged_in?
      flash[:alert] = "Please log in to access this page."
      redirect_to login_url
    end
  end

end
