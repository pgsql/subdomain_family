class DoctorDetail < ActiveRecord::Base
  belongs_to :users

  validates  :per_address, :per_city,:per_zip,:contact_address,:con_city,:con_zip, :college_name,:college_city,
             :college_state,:highest_degree,:register_no,:year_passed,:date_of_birth,:experience ,:presence=>true
end
