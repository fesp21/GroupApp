class AddPhoneCarrierToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :phone_carrier, :string
  end

  def self.down
    remove_column :users, :phone_carrier
  end
end
