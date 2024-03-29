class CreateConversations < ActiveRecord::Migration
  def self.up
    create_table :conversations do |t|
      t.string :origin
      t.string :target
      t.text :message

      t.timestamps
    end
  end

  def self.down
    drop_table :conversations
  end
end
