class Group < ActiveRecord::Base
  has_one :userlist
  has_many :permissions
  has_many :uploads, :dependent => :destroy
  has_many :todos, :dependent => :destroy
  has_many :posts, :dependent => :destroy
  has_many :memberships
  has_many :users, :through => :memberships
  
  /
  def after_create
    permissions.create( :name => "Admin", :description => "Sudo")
  end
  /
end
