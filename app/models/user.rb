class User < ActiveRecord::Base
  has_many :memberships
  has_many  :groups, :through => :memberships
  has_attached_file :photo,
  :storage => :s3,
  :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
  :path => ":photo/:id/:style/:basename.:extension",
  :bucket => 'storagebucket'
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/gif', 'image/png', 'image/emp']
  
  acts_as_authentic
  
  def self.search(search)
    search_condition = "%" + search + "%"
    find(:all, :conditions => ['username LIKE ?', search_condition])
  end
end

