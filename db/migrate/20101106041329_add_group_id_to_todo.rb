class AddGroupIdToTodo < ActiveRecord::Migration
  def self.up
    add_column :todos, :group_id, :integer
  end

  def self.down
    remove_column :todos, :group_id
  end
end
