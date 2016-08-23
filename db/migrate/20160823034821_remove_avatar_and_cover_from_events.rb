class RemoveAvatarAndCoverFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :avatar
    remove_column :events, :cover
  end
end
