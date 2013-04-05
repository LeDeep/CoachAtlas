class UsersController < ApplicationController

  def new
#    if params[:status] == nil then params => {:status => 1} end
    if params[:status] == nil then params[:status] = 1 end
    @user = User.new
  end

  def create 
    binding.pry
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
#      session[:status] = 1
      flash[:notice] = "Your account was successfully created. You are signed in!"
      redirect_to profiles_path
    else
      render :new
    end
  end
end