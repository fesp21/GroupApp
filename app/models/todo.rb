class Todo < ActiveRecord::Base
  belongs_to :group
  validates_presence_of :task
  validates_existence_of :group
end