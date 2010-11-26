class AddFinishedByToTodos < ActiveRecord::Migration
  def self.up
    add_column :todos, :finished_by, :integer
  end

  def self.down
    remove_column :todos, :finished_by
  end
end
