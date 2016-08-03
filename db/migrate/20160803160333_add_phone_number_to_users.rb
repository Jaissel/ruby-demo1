class AddPhoneNumberToUsers < ActiveRecord::Migration
  def change
    add_column :users, :phone, :string, null: false
  end
end
