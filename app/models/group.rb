class Group < ActiveRecord::Base
  has_one :userlist
  has_one :permission
end
