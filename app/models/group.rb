class Group < ActiveRecord::Base
  has_many :uploads, :dependent => :destroy
  has_many :todos, :dependent => :destroy
  has_many :posts, :dependent => :destroy
  has_many :memberships
  has_many :users, :through => :memberships
  has_many :newsfeeds, :dependent => :destroy
  has_many :conversations, :dependent => :destroy
  has_one :conference, :dependent => :destroy
  has_attached_file :photo,
  :default_url => "/images/groupdefault.png",
  :storage => :s3,
  :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
  :path => ":photo/:id/:style/:basename.:extension",
  :bucket => 'storagebucket'
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/gif', 'image/png', 'image/emp']
  
  def self.search(search)
    search_condition = "%" + search + "%"
    find(:all, :conditions => ['name LIKE ? or description LIKE ?', search_condition, search_condition])
  end
end
