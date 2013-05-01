class ContactDetail < ActiveRecord::Base

  belongs_to :user

  validates :first_name, :last_name, :email, :presence => true
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
  attr_accessible :first_name, :last_name, :address, :city, :state, :zip_code, :phone, :email, :user_id

end