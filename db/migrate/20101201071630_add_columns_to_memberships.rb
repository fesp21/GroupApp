class AddColumnsToMemberships < ActiveRecord::Migration
  def self.up
    add_column :memberships, :established, :boolean
    add_column :memberships, :request, :boolean
    add_column :memberships, :invitation, :boolean
  end

  def self.down
    remove_column :memberships, :invitation
    remove_column :memberships, :request
    remove_column :memberships, :established
  end
end
