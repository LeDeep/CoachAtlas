class Profile < ActiveRecord::Base

  validates :first_name, :last_name, :gender, :sport, :location, :contact_email, :bio, :user_id, :presence => true
  attr_accessible :first_name, :last_name, :gender, :sport, :location, :contact_email, :bio, :user_id
  


end