module SessionsHelper

  def log_in(user) #Login given user
    session[:user_id] = user.id
  end

  def current_user #Returns current logged-in user if any
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in? #is user logged in?
    !current_user.nil?
  end

  def log_out #log out current user
    session.delete(:user_id)
    @current_user = nil
  end

  def current_user?(user)
    user == current_user
  end

end
