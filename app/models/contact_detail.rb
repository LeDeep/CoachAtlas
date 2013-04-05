class ContactDetail < ActiveRecord::Base

  belongs_to :user

  validates :first_name, :last_name, :email, :presence => true
  
  attr_accessible :first_name, :last_name, :address, :city, :state, :zip_code, :phone, :email, :user_id

end