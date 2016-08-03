class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.string :avatar, null: false
      t.string :profile, null: false

      t.timestamps
    end
  end
end
