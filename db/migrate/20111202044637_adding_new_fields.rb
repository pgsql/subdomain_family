class AddingNewFields < ActiveRecord::Migration
  def self.up
    add_column :users, :terms_and_conditions, :boolean
    add_column :user_details, :ethnicity, :string
  end

  def self.down
    remove_column :users, :terms_and_conditions
    remove_column :user_details, :ethnicity
  end
end
