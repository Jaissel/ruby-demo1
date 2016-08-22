class CreateAttendances < ActiveRecord::Migration
  def self.up
    rename_table :event_users, :attendances
  end
  def self.down
    rename_table :attendances, :event_users
  end

end
