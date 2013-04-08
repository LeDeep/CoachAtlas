class User < ActiveRecord::Base

  #has_secure_password

  has_one :profile
  has_one :contact_detail
  has_many :jobs

  #attr_accessible :email, :password, :password_confirmation, :status

  # validates_uniqueness_of :email, :allow_blank => true

  def self.from_omniauth(auth)
    find_by_provider_and_uid(auth["provider"], auth["uid"]) || create_with_omniauth(auth)
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
    end
  end
end