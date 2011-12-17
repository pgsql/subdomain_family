class ClinicsController < ApplicationController
  
    before_filter :authenticate_user!
    before_filter :find_permission, :except => [:index]
	layout 'admin'
    
	def index
	  @sites = Site.all_sites
	end
	
	def new
	  @user = User.new
	  @site = Site.new
	end
	
	def create
	  @user = User.new(params[:user])
	  @site = Site.new(params[:site])
	  if @site.valid? && @user.valid?
		@site.save
		@user.type = "Admin"
		@user.site = @site
	    @user.save
		flash[:notice] = "The Account has been saved"
		redirect_to "/clinics"
	  else
	    render :new
	  end
	end
	
	def edit
	  @site = Site.find(params[:id]) rescue NotFound
	  @user = @site.get_admin
	end
	
	def update
	end
	
	private
	
    def find_permission
	  if @current_site.name == "admin"
	    has_permission = true
	  end
	  unless has_permission
	    redirect_to '/'
	  end
    end	
  
end