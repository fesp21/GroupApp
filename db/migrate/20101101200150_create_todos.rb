class CreateTodos < ActiveRecord::Migration
  def self.up
    create_table :todos do |t|
      t.string :task
      t.date :duedate
      t.boolean :finished

      t.timestamps
    end
  end

  def self.down
    drop_table :todos
  end
end
