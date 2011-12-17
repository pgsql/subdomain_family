class PatientsController < ApplicationController

   before_filter :authenticate_user!
   before_filter :selected_tab, :except => [:patient_details]
   layout 'default'

   def index
     #if current_user.is_complete?
     #flash[:notice]=" Logged in successfully"
       @patients = Patient.find :all
     #else
       #redirect_to "/patients/#{current_user.id}/edit"
     #end
   end
   
   # edit account for patient
   def edit
     @user = User.find(params[:id])
     @select = "My Account"
   end
   
   # update account for patient
   def update
     @user = User.find(params[:id])
     @user.attributes = params[:patient]
     @user_detail = UserDetail.new(params[:user_detail])
     if @user.valid? && @user_detail.valid?
        @user_detail.user_id = @user.id
        @user.save && @user_detail.save
        redirect_to :action => "index"
     else
       render :edit
     end
   end
   
   def patient_details
     if current_user.is_doctor?
       @select = "doctor_patients"
       @patient = Patient.find(params[:id])
      #@appointment = Appointment.find(params[:id])
     end
   end
   
   private
   
   def selected_tab
      @select = "home"
   end
   
      
   
end
