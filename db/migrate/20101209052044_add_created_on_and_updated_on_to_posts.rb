class AddCreatedOnAndUpdatedOnToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :created_on, :datetime
    add_column :posts, :updated_on, :datetime
  end

  def self.down
    remove_column :posts, :updated_on
    remove_column :posts, :created_on
  end
end
