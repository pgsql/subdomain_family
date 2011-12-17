class CreateUserDetails < ActiveRecord::Migration
  def self.up
    create_table :user_details do |t|
      t.integer :user_id
      t.date :date_of_birth
      t.text :postal_address
      t.string :marital_status
      t.string :occupation
      t.string :emergency_contact_name
      t.string :emergency_contact_relation
      t.string :emergency_contact_address
      t.string :emergency_contact_phone
      t.timestamps
    end
  end

  def self.down
    drop_table :user_details
  end
end
