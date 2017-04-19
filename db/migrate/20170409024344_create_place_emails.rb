class CreatePlaceEmails < ActiveRecord::Migration

  def change
    remove_column :places, :email, :string
    create_table :place_emails do |t|
      t.string :email, null: false
      t.references :place, index: true
    end
  end
end
