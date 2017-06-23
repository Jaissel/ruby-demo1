class AreaUser < ActiveRecord::Base
  belongs_to :area
  belongs_to :user

  validates_presence_of :area_id, :user_id
end