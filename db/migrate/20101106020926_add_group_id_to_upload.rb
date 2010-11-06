class AddGroupIdToUpload < ActiveRecord::Migration
  def self.up
    add_column :uploads, :group_id, :integer
	remove_column :uploads, :gid
  end

  def self.down
    remove_column :uploads, :group_id
	add_column :uploads, :gid, :integer
  end
end
