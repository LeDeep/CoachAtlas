class SessionsController < ApplicationController
  
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to profiles_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to profiles_path, notice: "Logged out!"
  end
end