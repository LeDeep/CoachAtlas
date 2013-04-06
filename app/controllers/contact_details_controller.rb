class ContactDetailsController < ApplicationController

 def new
    @contact_detail = ContactDetail.new
  end

  def create
    @contact_detail = ContactDetail.new(params[:contact_detail])
    if @contact_detail.save
      redirect_to contact_detail_path(@contact_detail), notice: "Your contact information has been created."
    else
      render new_contact_detail_path, alert: "Invalid input."
    end
  end

  def show
    @contact_detail = ContactDetail.find(params[:id])
  end
  

  def edit
    @contact_detail = ContactDetail.find(params[:id])
  end


  def update
    @contact_detail = ContactDetail.find(params[:id])
    if @contact_detail.update_attributes(params[:contact_detail])
      flash[:notice] = "Your contact_detail was successsfully updated."
      redirect_to contact_detail_path(@contact_detail)
    else
      flash[:alert] = "Invalid input."
      render :edit
    end
  end

end