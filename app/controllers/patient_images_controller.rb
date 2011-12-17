class PatientImagesController < ApplicationController
  # GET /patient_images
  # GET /patient_images.xml

  before_filter :authenticate_user!
  layout 'default'

  def index
    @patient_images = PatientImage.all
    respond_to do |format|
      format.html # index.html.erb
      #format.xml  { render :xml => @patient_images }
    end
  end

  # GET /patient_images/1
  # GET /patient_images/1.xml
  def show
    @patient_image = PatientImage.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @patient_image }
    end
  end

  # GET /patient_images/new
  # GET /patient_images/new.xml
  def new
    @patient_image = PatientImage.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @patient_image }
    end
  end

  # GET /patient_images/1/edit
  def edit
    @patient_image = PatientImage.find(params[:id])
  end

  # POST /patient_images
  # POST /patient_images.xml
  def create
    @patient_image = PatientImage.new(params[:patient_image])
    if current_user and current_user.type=='Patient'
       @patient_image.patient_id = current_user.id
       @image = @patient_image.save
    end
    if @image
      redirect_to "/patients"
    else
      render :new
    end
  end

  # PUT /patient_images/1
  # PUT /patient_images/1.xml
  def update
    @patient_image = PatientImage.find(params[:id])

    respond_to do |format|
      if @patient_image.update_attributes(params[:patient_image])
        format.html { redirect_to(@patient_image, :notice => 'Patient image was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @patient_image.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /patient_images/1
  # DELETE /patient_images/1.xml
  def destroy
    @patient_image = PatientImage.find(params[:id])
    @patient_image.destroy

    respond_to do |format|
      format.html { redirect_to(patient_images_url) }
      format.xml  { head :ok }
    end
  end
end
