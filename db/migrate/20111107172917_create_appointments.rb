class CreateAppointments < ActiveRecord::Migration
  def self.up
    create_table :appointments do |t|
      t.integer :doctor_id
      t.integer :patient_id
      t.datetime :start_time
      t.datetime :end_time
      t.string :hosiptal_name
      t.string :purpose

      t.timestamps
    end
  end

  def self.down
    drop_table :appointments
  end
end
