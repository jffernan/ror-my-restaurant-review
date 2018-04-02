class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user, notice: "Login successful!"
    else
      flash.now[:alert] = "Login unsuccesful! Please try again or signup!" #flash.now works w/ render
      render :new #Render is NOT request
    end
  end

  def destroy
    log_out
    redirect_to login_path, notice: "Log out successful!"
  end

end
