class AddDefaultTrueToAttendancesStatus < ActiveRecord::Migration
  def change
    change_column :attendances, :status, :boolean, :default => true
  end
end
