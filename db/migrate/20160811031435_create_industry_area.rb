class CreateIndustryArea < ActiveRecord::Migration
  def change
    create_table :industry_areas do |t|
      t.references :industry, index: true
      t.references :area, index: true

      t.timestamps
    end
  end
end
