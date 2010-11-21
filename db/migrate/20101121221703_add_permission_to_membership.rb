class AddPermissionToMembership < ActiveRecord::Migration
  def self.up
    add_column :memberships, :permission, :integer
  end

  def self.down
    remove_column :memberships, :permission
  end
end
