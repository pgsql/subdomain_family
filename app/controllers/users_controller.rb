class UsersController < ApplicationController

   before_filter :authenticate_user!
   before_filter :find_site
   before_filter :find_admin_permission

   layout 'default'
   
   def index
      @master_accounts = @current_site.users.where('master_id = ?', current_user.id)
      @select = "user"
      @select ="admin"
      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @master_accounts }
      end
   end
   
   def show
     @user = @current_site.users.find(params[:id])
     respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
     end
   end

   def edit
     @user= @current_site.users.find(params[:id])
   end

   def update
    @user = @current_site.users.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user,
                      :notice => 'User Was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors,
                      :status => :unprocessable_entity }
      end
    end
   end

  def destroy
    @user = @current_site.users.find(params[:id])
    @user.delete
    respond_to do |format|
      format.html { redirect_to'/users' }
      format.xml  { head :ok }
    end
  end

  # Creating Master Account
  
   def new
     @user = @current_site.users.new
   end
   
   def create_master_account
     @user = @current_site.users.new(params[:user])
     if @user.valid?
        @user.master_id = current_user.id
        @user.save
        redirect_to '/doctors'
     else
        render :new
     end
   end   
   
   private
  
   def find_admin_permission
     if current_user.is_admin?
        has_access = true
     else
        has_access = false
     end
     if !has_access
       redirect_to "/home"
     end
   end

  
end
