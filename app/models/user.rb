class User < ActiveRecord::Base
   
  belongs_to :site
  
  attr_writer :current_step

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :type, :password, :password_confirmation, :remember_me, :first_name, :last_name,
                  :title, :address, :home_number, :office_number, :mobile_number, :country, :city, :zipcode
  
  has_one :user_detail
  has_many :uploads  
  
  validates_presence_of :first_name, :if => :first_name 
  validates_presence_of :last_name, :if => :last_name
  validates_presence_of :title, :if => :title
  validates_presence_of :address, :if => :address
  validates_presence_of :home_number, :if => :home_number 
  
  validates_uniqueness_of :email, :scope => :site_id, :case_sensitive => false 
  
  validates_acceptance_of :terms_and_conditions, :if => :terms_and_conditions  
  
  # authentication based on subdomain
  def self.find_for_authentication(conditions={}) 
     site = Site.where('name = ?', conditions[:subdomain]).first
     self.find_by_email_and_site_id(conditions[:email], site.id)
  end

  def name
    first_name + " " + last_name
  end
  
  def is_admin?
    self.type == "Admin"
  end

  def is_doctor?
    self.type == "Doctor"
  end

  def is_patient?
    self.type == "Patient"
  end

  def is_staff?
    self.type == "Staff"
  end

  def is_nurse?
    self.type == "Nurse"
  end
  
  def is_company?
    self.type == "Company"
  end
  
  def is_account_user?
    self.type == "AccountUser"
  end
  
  def is_complete?
    if (  ( ( (!self.first_name.nil? && !self.last_name.nil?) && (!self.title.nil? && !self.user_detail.date_of_birth.nil?) ) && ( (!self.address.nil? && !self.user_detail.postal_address.nil?) && ( !self.home_number.nil? && !self.user_detail.emergency_contact_name.nil?) )    ) && (  ( (!self.user_detail.emergency_contact_relation.nil? && !self.user_detail.emergency_contact_address.nil?)     && !self.user_detail.emergency_contact_phone.nil? )        )      )
      true
    else
      false
    end
  end
  
  # Registration Process by stepwise 
  
  def current_step  
    @current_step || steps.first
  end
  
  def steps
    %w[user_basic user_details user_total]
  end 
  
  def next_step  
    self.current_step = steps[steps.index(current_step)+1]
  end
  
  def previous_step  
    self.current_step = steps[steps.index(current_step)-1]  
  end
  
  def first_step?  
    current_step == steps.first  
  end 
  
  def last_step?  
    current_step == steps.last  
  end
  
  def firststep
    self.current_step = "user_basic"
  end
  
  def finalstep
    self.current_step = "user_total"
  end
  
  def get_previous_step(selected_type)
    if selected_type == "Patient"  ||  selected_type == "Doctor"
      self.previous_step
    else
      self.firststep
    end
  end
  
  def get_next_step(selected_type)
    if selected_type == "Patient" ||  selected_type == "Doctor"
     self.next_step
    else
     self.finalstep
    end
  end
  

  
end
