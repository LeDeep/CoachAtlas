class SessionsController < ApplicationController
  
  def create
    if user = User.from_omniauth(env["omniauth.auth"])
      session[:user_id] = user.id
      redirect_to root_url
      flash[:notice] = "Signed in!"
    else
      redirect_to root_url
      flash[:alert] = "Email or password is invalid." 
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
    flash[:notice] = "Logged out!"
  end

  def failure
    redirect_to root_url
    flash[:alert] = "Email or password was invalid."
  end
end