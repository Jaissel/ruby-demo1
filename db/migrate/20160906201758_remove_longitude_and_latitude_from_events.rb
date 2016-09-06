class RemoveLongitudeAndLatitudeFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :latitude
    remove_column :events, :longitude
  end
end
