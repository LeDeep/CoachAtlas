class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Your account was successfully created. You are signed in!"
      redirect_to new_user_path
    else
      flash[:alert] = "Please enter a valid email and password."
      render :new
    end
  end
end