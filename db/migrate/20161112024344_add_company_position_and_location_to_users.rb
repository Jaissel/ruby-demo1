class AddCompanyPositionAndLocationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :location, :string
    add_column :users, :company, :string
    add_column :users, :position, :string
  end
end
