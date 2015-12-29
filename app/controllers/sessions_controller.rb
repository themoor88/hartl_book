class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    # Authenticate is a method from rails that looks up the email and password.
    if user && user.authenticate(params[:session][:password])
      log_in user
      # Redirect to the user's profile page.
      redirect_to user
    else
      # This fixes the flash message on redirect.
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
  end
end
