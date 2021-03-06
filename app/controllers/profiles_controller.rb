class ProfilesController < ApplicationController

  load_and_authorize_resource  


  def new
    @profile = Profile.new
  end

  def create
    @profile = User.find(session[:user_id]).build_profile(params[:profile])
    if @profile.save
      redirect_to new_contact_detail_path
      flash[:notice] = "Your profile has been created."
    else
      render new_profile_path
      flash[:alert] = "Invalid input."
    end
  end

  def index
    @profiles = Profile.text_search(params[:query])
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update_attributes(params[:profile])
      flash[:notice] = "Your profile was successsfully updated."
      redirect_to profile_path(@profile.id)
    else
      render :edit
      flash[:alert] = "Invalid input."
    end
  end

  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy
    flash[:notice] = "Your profile was successfully deleted."
    redirect_to profiles_path
  end
end