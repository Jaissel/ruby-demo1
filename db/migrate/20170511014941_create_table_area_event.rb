class CreateTableAreaEvent < ActiveRecord::Migration
  def change
    create_table :area_events do |t|

    t.references :event, index: true
    t.references :areas, index: true

    t.timestamps    	
    end
  end
end
