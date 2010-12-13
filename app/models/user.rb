class User < ActiveRecord::Base
  has_many :memberships
  has_many  :groups, :through => :memberships
  has_attached_file :photo,
  :default_url => "/images/default.png",
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
  
 def self.findNewsFeed(num)
	@user = User.find(:all, :conditions => {:id => num})[0]
	if(@user != nil)
		@my_groups = @user.groups
		@all_newsfeeds = []
		@my_groups.each do |group|
		  @membership = Membership.find_by_user_id_and_group_id(num, group.id)
		  if @membership.established
			  group.newsfeeds.reverse.first(20).each do |newsfeed|
				  @all_newsfeeds << newsfeed
			  end
		  end
		end
    return @all_newsfeeds.sort!{|a,b| a.created_at <=> b.created_at}.reverse.first(20)
	end  
 end
end

