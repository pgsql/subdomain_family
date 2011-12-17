class ChangeDateOfBirthType < ActiveRecord::Migration
  def self.up
    change_column :user_details, :date_of_birth, :datetime
  end

  def self.down
    change_column :user_details, :date_of_birth, :date
  end
end
