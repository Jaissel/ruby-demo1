class CreateTableAreaUser < ActiveRecord::Migration
  def change
    create_table :area_users do |t|

    t.references :user, index: true
    t.references :area, index: true

    t.timestamps
    end
  end
end
