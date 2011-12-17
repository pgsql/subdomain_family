class CreateTreatmentForms < ActiveRecord::Migration
  def self.up
    create_table :treatment_forms do |t|
      t.integer :patient_id
      t.integer :doctor_id
      t.date :date
      t.string :complaints
      t.integer :rating
      t.boolean :aggravating_factors
      t.text :aggravating_factors_text
      t.boolean :new_injuries
      t.text :new_injuries_text
      t.timestamps
    end
  end

  def self.down
    drop_table :treatment_forms
  end
end
