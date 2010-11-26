class AddLinkToNewsfeed < ActiveRecord::Migration
  def self.up
    add_column :newsfeeds, :link, :string
  end

  def self.down
    remove_column :newsfeeds, :link
  end
end
