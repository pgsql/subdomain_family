class Patient < User

  acts_as_tree :foreign_key => "master_id"
  has_many :appointments
  has_many :patient_images
  
  has_many :doctor_patients
  has_many :doctors, :through => :doctor_patients,  :source => :doctor
  
  has_one :treatment_form

  belongs_to :parent , :foreign_key => "master_id" ,:class_name => "User"

  
end 