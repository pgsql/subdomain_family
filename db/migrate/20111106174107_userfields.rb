class Userfields < ActiveRecord::Migration
  def self.up
     add_column :users, :type, :string
     add_column :users, :title, :string
     add_column :users, :home_number, :string
     add_column :users, :mobile_number, :string
     add_column :users, :office_number, :string
     add_column :users, :company_name, :string
     remove_column :users, :roles
  end

  def self.down
     remove_column :users, :type
     remove_column :users, :title
     remove_column :users, :home_number
     remove_column :users, :mobile_number
     remove_column :users, :office_number
     remove_column :users, :company_name
     add_column :users, :roles, :string
  end
end
