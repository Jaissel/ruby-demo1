class CreateTableAreaUser < ActiveRecord::Migration
  def change
    create_table :area_users do |t|

    t.references :users, index: true
    t.references :areas, index: true

    t.timestamps
    end
  end
end
