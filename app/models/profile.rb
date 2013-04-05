class Profile < ActiveRecord::Base

  validates :gender, :sport, :working_zip_code, :bio, :user_id, :presence => true
  attr_accessible :gender, :sport, :working_zip_code, :bio, :picture, :user_id
  validates_attachment_content_type :picture, :content_type => ["image/jpg", "image/png" ]
  validates_attachment_size :picture, :less_than => 3.megabytes

  belongs_to :user

  has_attached_file :picture, :styles => { :small => "150x150>", :thumb => "100x100>" }, 
                    :url => "/images/:style/:basename.:extension",
                    :path => ":rails:root/tmp/images/:id/:style/basename.:extension"

end
