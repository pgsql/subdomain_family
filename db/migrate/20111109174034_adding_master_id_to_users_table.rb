class AddingMasterIdToUsersTable < ActiveRecord::Migration
  def self.up
    add_column :users, :master_id, :integer
  end

  def self.down
    remove_column :users, :master_id
  end
end
