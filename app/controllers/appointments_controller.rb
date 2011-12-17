class AppointmentsController < ApplicationController
  # GET /appointments
  # GET /appointments.xml
   before_filter :authenticate_user!
   before_filter :selected_tab
   layout 'default'
  
  def index
    if current_user.is_patient?
      @appointments = Appointment.where('patient_id= ?', current_user.id)
    elsif current_user.is_doctor?
      @appointments = Appointment.where('doctor_id= ? ', current_user.id)
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @appointments }
    end
  end
  
  def appointment_approve
     appointment = Appointment.find(params[:id])
     appointment.approve_status = 2
     appointment.save!
     UserMailer.appointment_confirmation(appointment).deliver
     redirect_to "/appointments"
  end

  # GET /appointments/1
  # GET /appointments/1.xml
  def show
    @appointment = Appointment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @appointment }
    end
  end

  # GET /appointments/new
  # GET /appointments/new.xml
  def new
    @appointment = Appointment.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @appointment }
    end
  end

  # GET /appointments/1/edit
  def edit
    @appointment = Appointment.find(params[:id])
  end

  # POST /appointments
  # POST /appointments.xml
  def create
    @appointment = Appointment.new(params[:appointment])
    @appointment.patient_id = current_user.id  if current_user.is_patient?    
    @appointment.approve_status = 1
    if @appointment.save
      DoctorPatient.create({:patient_id => @appointment.patient_id, :doctor_id => @appointment.doctor_id })
      UserMailer.appointment_pending(@appointment).deliver
      redirect_to "/appointments"
    else
      render :new
    end
  end

  # PUT /appointments/1
  # PUT /appointments/1.xml
  def update
    @appointment = Appointment.find(params[:id])
    if @appointment.update_attributes(params[:appointment])
      @appointment.approve_status = 1
      @appointment.save
      UserMailer.appointment_pending(@appointment).deliver
      redirect_to "/appointments"
    else
      render :edit
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.xml
  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy

    respond_to do |format|
      format.html { redirect_to(appointments_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  
  def selected_tab
    @select = "appointment"
  end
  
end
