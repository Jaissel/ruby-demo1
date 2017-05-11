class CreateTableIndustryUser < ActiveRecord::Migration
  def change
    create_table :industry_users do |t|

    t.references :user, index: true
    t.references :industry, index: true

    t.timestamps
    end
  end
end
