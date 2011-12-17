class CreateDoctorDetails < ActiveRecord::Migration
  def self.up
    create_table :doctor_details do |t|
      t.integer :user_id
      t.string :nationality ,:limit=>15
      t.string :father_name ,:limit=>50
      t.string :mother_name ,:limit=>50
      t.text :per_address
      t.string :per_city
      t.string :per_zip
      t.text :contact_address
      t.string :con_city
      t.string :con_zip
      t.string :marital_status
      t.string :relegion
      t.string :college_name
      t.string :college_city
      t.string :college_state
      t.string :highest_degree
      t.string :register_no
      t.datetime :year_passed
      t.datetime :date_of_birth
      t.integer :experience
      t.timestamps
    end
  end

  def self.down
    drop_table :doctor_details
  end
end
