module ApplicationHelper

    def image_file_name(patient_image)
       file = File.basename(patient_image.image.to_s.gsub(/\\/, '/')) if !patient_image.nil?
       file
    end
    
    def get_file(upload_obj)
      newfile = File.basename(upload_obj.my_file.to_s.gsub(/\\/, '/')) if !upload_obj.nil?
      newfile
    end
    def subdomain(request)
	request.split(".").first unless request.blank?
    end
  
end
