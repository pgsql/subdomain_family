class Admin::AppointmentsController < ApplicationController

  layout 'default'
  
  def index
    @appointments =  Appointment.all
    @select = "/admin/appointments"
  end
  def new
    @appointment = Appointment.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @appointment }
    end
  end

  def create
   puts "******************************************************************"
   @appointment = Appointment.new(params[:appointment])
   @appointment.approve_status = 1
    if @appointment.save
      DoctorPatient.create({:patient_id => @appointment.patient_id, :doctor_id => @appointment.doctor_id })
      UserMailer.appointment_pending(@appointment).deliver
      redirect_to "/admin/appointments"
    else
      render :new
    end
  end
  def edit
    @appointment=Appointment.find(params[:id])
  end
 def update
     @appointment = Appointment.find(params[:id])
    if @appointment.update_attributes(params[:appointment])
      @appointment.approve_status = 1
      @appointment.save
      UserMailer.appointment_pending(@appointment).deliver
      redirect_to "/admin/appointments"
    else
      render :edit
    end
  end

  def show
    @appointment = Appointment.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @appointment }
    end
  end


  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to(admin_appointments_url) }
      format.xml  { head :ok }
    end
  end

end
