class AddAllowTextToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :allow_text, :boolean
  end

  def self.down
    remove_column :users, :allow_text
  end
end
