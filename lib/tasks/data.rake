   
namespace :bootstrap do
  
    desc "Creating Default data"
    task :data => :environment do 
       
       site_one = Site.create(:name => "sample")
       site_two = Site.create(:name => "testing")

       site_one.users.create(:email => "doctor@example.com", :password => "password", :confirm_password => "password", :type => "Doctor" )
       site_two.users.create(:email => "doctortwo@example.com", :password => "password", :confirm_password => "password", :type => "Doctor" )

    end

end