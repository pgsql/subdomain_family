class UploadsController < ApplicationController
  # GET /uploads
  # GET /uploads.xml
  
  before_filter :authenticate_user!
  before_filter :selected_tab
  layout 'default'
  
  def index
    @uploads = Upload.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @uploads }
    end
  end

  # GET /uploads/1
  # GET /uploads/1.xml
  def show
    @upload = Upload.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @upload }
    end
  end

  # GET /uploads/new
  # GET /uploads/new.xml
  def new
    @upload = Upload.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @upload }
    end
  end

  # GET /uploads/1/edit
  def edit
    @upload = Upload.find(params[:id])
  end
  
  def download
    upload = Upload.find(params[:id])
    send_file "#{Rails.root}/public#{upload.my_file}"
  end
  
 # /uploads/upload/my_file/1/Eshwar_Gouthama.docx 
  
  # POST /uploads
  # POST /uploads.xml
  def create
    @upload = Upload.new(params[:upload])
    @upload.user_id = current_user.id if current_user
    if @upload.save
      redirect_to "/patients"
    else
      render :new
    end
  end

  # PUT /uploads/1
  # PUT /uploads/1.xml
  def update
    @upload = Upload.find(params[:id])

    respond_to do |format|
      if @upload.update_attributes(params[:upload])
        format.html { redirect_to(@upload, :notice => 'Upload was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @upload.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /uploads/1
  # DELETE /uploads/1.xml
  def destroy
    @upload = Upload.find(params[:id])
    @upload.destroy

    respond_to do |format|
      format.html { redirect_to(uploads_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  
  def selected_tab
    @select = "upload"
  end
  
end
