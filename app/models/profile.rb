class Profile < ActiveRecord::Base

  validates :gender, :sport, :working_zip_code, :bio, :user_id, :presence => true
  attr_accessible :gender, :sport, :working_zip_code, :bio, :picture, :user_id
  validates_attachment_content_type :picture, :content_type => ["image/jpg", "image/png" ]
  validates_attachment_size :picture, :less_than => 3.megabytes

  belongs_to :user

  has_attached_file :picture, :styles => { :small => "150x150>", :thumb => "100x100>" }, 
                    :url => "/images/:style/:basename.:extension",
                    :path => ":rails:root/tmp/images/:id/:style/basename.:extension"

  include PgSearch
  pg_search_scope :search, against: [:sport, :working_zip_code],
  using: {tsearch: {dictionary: "english"}},
  ignoring: :accents

  GENDER = ['Male', 'Female']


  def self.text_search(query)
    if query.present?
      # search(query)
      rank = <<-RANK
        ts_rank(to_tsvector(sport), plainto_tsquery(#{sanitize(query)})) +
        ts_rank(to_tsvector(working_zip_code), plainto_tsquery(#{sanitize(query)}))
      RANK
    where("to_tsvector('english', sport) @@ :q or to_tsvector('english', working_zip_code) @@ :q", q: query).order("#{rank} DESC")
    else
      scoped
    end
  end
end
