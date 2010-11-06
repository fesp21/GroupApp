class Upload < ActiveRecord::Base
	belongs_to :group
	has_attached_file :attachment
	validates_existence_of :group
end
