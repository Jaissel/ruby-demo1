class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.datetime :schedule, null: false
      t.string :avatar, null: false
      t.string :cover, null: false
      t.integer :capacity, null: false

      t.timestamps
    end
  end
end
