class UserDetail < ActiveRecord::Base

    belongs_to :user
	#belongs_to :patient  #, :class_name => "User", :foreign_key => :user_id
	
	validates_presence_of :date_of_birth, :if => :date_of_birth
	validates_presence_of :postal_address, :if => :postal_address
	validates_presence_of :emergency_contact_name, :if => :emergency_contact_name
	validates_presence_of :emergency_contact_relation, :if => :emergency_contact_relation
	validates_presence_of :emergency_contact_address, :if => :emergency_contact_address
	validates_presence_of :emergency_contact_phone, :if => :emergency_contact_phone
	validates_presence_of :ethnicity, :if => :ethnicity
	
end
