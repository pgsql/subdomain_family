class AddApproveField < ActiveRecord::Migration
  def self.up
    add_column :appointments, :approve_status, :integer
  end

  def self.down
    remove_column :appointments, :approve_status
  end
end
