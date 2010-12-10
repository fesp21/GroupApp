class AddGroupIdToConversations < ActiveRecord::Migration
  def self.up
    add_column :conversations, :group_id, :integer
  end

  def self.down
    remove_column :conversations, :group_id
  end
end
