class JobsController < ApplicationController

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(params[:job])
    if @job.save
      redirect_to jobs_path, notice: "Your job has been created."
    else
      render new_job_path, alert: "Invalid input."
    end
  end

  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update_attributes(params[:job])
      flash[:notice] = "Your job was successsfully updated."
      redirect_to jobs_path
    else
      render :edit
      flash[:alert] = "Invalid input."
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    flash[:notice] = "Your job was successfully deleted."
    redirect_to jobs_path
  end

end