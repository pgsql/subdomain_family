class TreatmentFormsController < ApplicationController

    before_filter :authenticate_user!
	before_filter :selected_tab
	before_filter :check_doctor, :except => [:index, :show]
	before_filter :check_if_not_admin
	layout 'default'
	
    def index
	  @treatment_forms = TreatmentForm.find :all
	end
	
	def new
      @patients = Patient.find :all
	  @treatment_form = TreatmentForm.new
	end
	
	def create
	  @patients = Patient.find :all
	  @treatment_form = TreatmentForm.new(params[:treatment_form])
	  if @treatment_form.valid?
	    @treatment_form.doctor_id = current_user.id
	    @treatment_form.save
		redirect_to "/treatment_forms"
	  else
	    render :new
	  end
	end
	
	def edit
	  @patients = Patient.find :all
	  @treatment_form = TreatmentForm.find(params[:id])
	end
	
	def update
	  @patients = Patient.find :all
	  @treatment_form = TreatmentForm.find(params[:id])
	  if @treatment_form.update_attributes(params[:treatment_form])
		 redirect_to "/treatment_forms"
	  else
		 render :edit
	  end
	end
	
	def show
	  @treatment_form = TreatmentForm.find(params[:id])
	end
	
	def destroy
	  @treatment_form = TreatmentForm.find(params[:id])
	  @treatment_form.destroy
	  redirect_to "/treatment_forms"
	end
		
	
	private

	def selected_tab
	  @select =  "treatment_form"
	end
	
	def check_doctor
	  if current_user.is_doctor?
	     has_access = true
	  else
	     has_access = false
	  end
	  if !has_access
	    redirect_to "/treatment_forms"
	  end
	end
	
    def check_if_not_admin
	  if current_user.type != "Admin"
		 has_access = true
	  else
		 has_access = false
	  end
	  if !has_access
		redirect_to "/home"
	  end
	end


end
