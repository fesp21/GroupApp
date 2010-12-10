class Upload < ActiveRecord::Base
	belongs_to :group
	validates_existence_of :group
	has_attached_file :attachment,
  :storage => :s3,
  :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
  :path => ":attachment/:id/:style/:basename.:extension",
  :bucket => 'storagebucket'
  validates_attachment_presence :attachment
end
