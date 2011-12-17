   
namespace :bootstrap do
  
    desc "Creating Admin data"
    task :admin => :environment do
       
       @site_one = Site.create(:name => "admin")
       @site_one.users.create(:email => "admin@example.com", :password => "password", :confirm_password => "password", 
                              :type => "Admin")
    
    end

end