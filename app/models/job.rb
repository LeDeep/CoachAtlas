class Job < ActiveRecord::Base

  belongs_to :user

  validates :listing_title, :sport, :gender, :city, :state, :zip_code, :description, :user_id, :presence => true

  attr_accessible :listing_title, :sport, :gender, :city, :state, :zip_code, :description, :user_id

  # def self.search(search)
  #   if search
  #     where('sport LIKE ?', "%#{search}%")
  #     # where('sport LIKE ?', "%#{search}%" && 'city LIKE ?', "%#{search}%", 'state LIKE ?', "%#{search}%", 'zip_code LIKE ?', "%#{search}%", "%#{search}%")
  #   else
  #     all
  #   end
  # end

  scope :zip_code, lambda { |zip_code| where(:zip_code => zip_code) } 
  scope :sport, lambda { |sport| where(:sport => sport) }
  # scope :city, lambda { |city| where(:city => city) }
  # scope :state, lambda { |state| where(:state => state) }

  # def self.search(search)
  #   results = []
  #   if search[:sport]
  #     results << Job.sport(search[:sport])
  #   end
  #   if search[:zip_code]
  #     if results.length == 0 
  #       results << Job.zip_code(search[:zip_code])
  #     else
  #       results.include?(search[:zip_code])
  #     end
  #   end
    # if search[:state]
    #   if results.length == 0 
    #     results << Job.state(search[:state])
    #   else
    #     results Job.state(search[:state])
    #   end
    # end
    # if search[:city]
    #   if results.length == 0 
    #     results << Job.state(search[:state])
    #   else
    #     results Job.state(search[:state])
    #   end
    # end

  # end
end