class User < ActiveRecord::Base
  has_many :memberships
  has_many  :groups, :through => :memberships
  acts_as_authentic
end

