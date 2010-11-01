class CreateUploads < ActiveRecord::Migration
  def self.up
    create_table :uploads do |t|
      t.integer :gid
      t.string :filename
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :uploads
  end
end
