class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.references :event, index: true

      t.timestamps
    end
  end
end
