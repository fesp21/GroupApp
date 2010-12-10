class Group < ActiveRecord::Base
  has_many :uploads, :dependent => :destroy
  has_many :todos, :dependent => :destroy
  has_many :posts, :dependent => :destroy
  has_many :memberships
  has_many :users, :through => :memberships
  has_many :newsfeeds, :dependent => :destroy
  has_many :conversations, :dependent => :destroy
  
  def self.search(search)
    search_condition = "%" + search + "%"
    find(:all, :conditions => ['name LIKE ? or description LIKE ?', search_condition, search_condition])
  end
end
