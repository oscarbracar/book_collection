class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    email = auth.info.email

    unless email.end_with?("@tamu.edu")
      redirect_to root_path, alert: "Only @tamu.edu email addresses are allowed"
      return
    end

    user = User.from_omniauth(auth)
    session[:user_id] = user.id
    redirect_to root_path, notice: "Successfully logged in as #{user.email}"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Successfully logged out"
  end

  def failure
    redirect_to root_path, alert: "Authentication failed: #{params[:message]}"
  end
end
