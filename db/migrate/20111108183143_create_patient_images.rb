class CreatePatientImages < ActiveRecord::Migration
  def self.up
    create_table :patient_images do |t|
      t.string :image
      t.integer :patient_id
      t.timestamps
    end
  end

  def self.down
    drop_table :patient_images
  end
end
