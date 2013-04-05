class SessionsController < ApplicationController
  
  def create
    if user = User.from_omniauth(env["omniauth.auth"])
      session[:user_id] = user.id
      redirect_to root_url, notice: "Signed in!"
    else
      redirect_to new_session_path, alert: "Email or password is invalid." 
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end

  def failure
    redirect_to root_url, alert: "Authentication failed, please try again."
  end
end