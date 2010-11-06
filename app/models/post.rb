class Post < ActiveRecord::Base
	belongs_to :group
	has_many :comments, :dependent => :destroy
end
