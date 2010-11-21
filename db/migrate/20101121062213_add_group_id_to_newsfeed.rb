class AddGroupIdToNewsfeed < ActiveRecord::Migration
  def self.up
    add_column :newsfeeds, :group_id, :integer
  end

  def self.down
    remove_column :newsfeeds, :group_id
  end
end
