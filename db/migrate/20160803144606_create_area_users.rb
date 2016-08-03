class CreateAreaUsers < ActiveRecord::Migration
  def change
    create_table :area_users do |t|
      t.integer :user_id, null: false
      t.integer :area_id, null: false

      t.timestamps
    end
  end
end
