class ApplicationController < ActionController::Base
   
   protect_from_forgery
   layout 'login'
   before_filter :find_site
  
   def after_sign_out_path_for(resource_or_scope)
      '/users/sign_in'
   end
   def find_site
      if(request.subdomain != nil)
         @current_site = Site.where('name = ?', request.subdomain.split(".").first).first
      else
        raise BadRequest
      end
   end
  
end
