class CreateUserlists < ActiveRecord::Migration
  def self.up
    create_table :userlists do |t|
      t.int :uid
      t.int :permissionid

      t.timestamps
    end
  end

  def self.down
    drop_table :userlists
  end
end
