class User < ActiveRecord::Base

  has_secure_password

  has_one :profile
  has_one :contact_detail
  has_many :jobs
<<<<<<< HEAD

  attr_accessible :email, :password, :password_confirmation, :status

=======

  attr_accessible :email, :password, :password_confirmation, :status

>>>>>>> add_jobs
  validates :email, :presence => :true

  validates_uniqueness_of :email

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end