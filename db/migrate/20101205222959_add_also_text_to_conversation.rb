class AddAlsoTextToConversation < ActiveRecord::Migration
  def self.up
    add_column :conversations, :also_text, :boolean
  end

  def self.down
    remove_column :conversations, :also_text
  end
end
