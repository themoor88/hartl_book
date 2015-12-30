module SessionsHelper
  # Logs in the given user.
  def log_in(user)
    # Add another key value pair to the session hash that identifies the user.
    session[:user_id] = user.id
  end

  def current_user
    # This is idiomatically correct in ruby and is the same as current_user || User.find_by
    @current_user || = User.find_by(id: session[:user_id])
  end

  # A method that checks if the user is logged in and returns true if it is the case.
  def logged_in?
    !current_user.nil?
  end
end
