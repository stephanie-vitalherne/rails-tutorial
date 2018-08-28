module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !current_user.nil? # this checks to see if the current user is logged in or not
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end

# when you perform an action on current user, its because there is not current user and the session id has not been passed thru the def
