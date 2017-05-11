class CreateTableIndustryEvent < ActiveRecord::Migration
  def change
    create_table :industry_events do |t|

    t.references :events, index: true
    t.references :industry, index: true

    t.timestamps
    end
  end
end
