class Upload < ActiveRecord::Base
   
   attr_accessible :my_file
   mount_uploader :my_file, FileStoreUploader
   
   belongs_to :user
   
   
end
