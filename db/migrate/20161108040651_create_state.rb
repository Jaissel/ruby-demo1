class CreateState < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :name, null: false
      t.references :country, index: true
    end
  end
end
