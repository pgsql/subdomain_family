class PatientImage < ActiveRecord::Base

   attr_accessible :image
   mount_uploader :image, ImageStoreUploader
   
   belongs_to :patient
  # validates :patient_id, :uniqueness => true

end
