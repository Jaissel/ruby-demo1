class CreateEventUsers < ActiveRecord::Migration
  def change
    create_table :event_users do |t|
      t.integer :user_id, null: false
      t.integer :event_id, null: false
      t.boolean :status, null: false

      t.timestamps
    end
  end
end
