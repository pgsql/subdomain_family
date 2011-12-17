class Nurse < User
  belongs_to :parent , :foreign_key => "master_id" ,:class_name => "User"
end

