class Job < ActiveRecord::Base

  belongs_to :user

  validates :listing_title, :sport, :gender, :city, :state, :zip_code, :description, :user_id, :presence => true

  attr_accessible :listing_title, :sport, :gender, :city, :state, :zip_code, :description, :user_id

end