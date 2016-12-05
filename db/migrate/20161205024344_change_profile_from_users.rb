class ChangeProfileFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :profile, :string
    add_column :users, :profile, :string
  end
end