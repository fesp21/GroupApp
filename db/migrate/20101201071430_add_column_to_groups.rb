class AddColumnToGroups < ActiveRecord::Migration
  def self.up
    add_column :groups, :private, :boolean
  end

  def self.down
    remove_column :groups, :private
  end
end
