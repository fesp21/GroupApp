class RemoveUserlistsAndPermissionsAndCalendars < ActiveRecord::Migration
  def self.up
	drop_table :permissions
	drop_table :userlists
	drop_table :calendars
  end

  def self.down
  end
end
