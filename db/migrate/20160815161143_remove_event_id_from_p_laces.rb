class RemoveEventIdFromPLaces < ActiveRecord::Migration
  def change
    remove_column :places, :event_id
  end
end
