class CreateIndustryAreaUsers < ActiveRecord::Migration
  def change
    create_table :industry_area_users do |t|
      t.references :user, index: true
      t.references :industry_area, index: true

      t.timestamps
    end
  end
end
