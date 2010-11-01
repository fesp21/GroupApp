class Group < ActiveRecord::Base
  has_one :userlist
  has_many :permissions
  
  def after_create
    permissions.create( :name => "Admin", :description => "Sudo", :group_id => self.id)
  end
end
