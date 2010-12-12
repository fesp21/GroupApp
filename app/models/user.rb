class User < ActiveRecord::Base
  has_many :memberships
  has_many  :groups, :through => :memberships
  acts_as_authentic
  
  def self.search(search)
    search_condition = "%" + search + "%"
    find(:all, :conditions => ['username LIKE ?', search_condition])
  end
end

