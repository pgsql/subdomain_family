class Doctor < User

  has_many :appointments
    
  has_many :doctor_patients
  has_many :patients, :through => :doctor_patients,  :source => :patient
  
  
end
