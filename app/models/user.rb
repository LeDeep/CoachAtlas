class User < ActiveRecord::Base
  has_secure_password

  has_one :profile
  has_one :contact_detail
  has_many :jobs

  attr_accessible :email, :password, :password_confirmation, :status

  validates :email, :presence => :true

  validates_uniqueness_of :email

end