class RemoveColumnFromUser < ActiveRecord::Migration
  def self.up
    remove_column :users, :name
    remove_column :users, :hash_password
    remove_column :users, :salt
  end

  def self.down
    add_column :users, :salt, :string
    add_column :users, :hash_password, :string
    add_column :users, :name, :string
  end
end
