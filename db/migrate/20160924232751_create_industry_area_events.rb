class CreateIndustryAreaEvents < ActiveRecord::Migration
  def change
    create_table :industry_area_events do |t|
      t.references :event, index: true
      t.references :industry_area, index: true

      t.timestamps
    end
  end
end
