class CreateDoctorPatients < ActiveRecord::Migration
  def self.up
    create_table :doctor_patients do |t|
      t.integer :doctor_id
      t.integer :patient_id
      t.timestamps
    end
  end

  def self.down
    drop_table :doctor_patients
  end
end
