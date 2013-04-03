class ProfilesController < ApplicationController

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(params[:profile])
    if @profile.save
      redirect_to new_profile_path, notice: "Thank you for signing up with Coach Atlas. Your account has been created."
    else
      render new_profile_path, alert: "Invalid input."
    end
  end

end