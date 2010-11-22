class Group < ActiveRecord::Base
  has_one :userlist
  has_many :permissions
  has_many :uploads, :dependent => :destroy
  has_many :todos, :dependent => :destroy
  has_many :posts
  has_many :memberships
  has_many :users, :through => :memberships
  has_many :newsfeeds, :dependent => :destroy
  
  def self.search(search)
    search_condition = "%" + search + "%"
    find(:all, :conditions => ['name LIKE ? or description LIKE ?', search_condition, search_condition])
  end
end
