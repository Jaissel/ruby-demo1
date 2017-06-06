class Area < ActiveRecord::Base
  
  has_many :area_users
  has_many :users, through: :area_users

  has_many :area_events
  has_many :events, through: :area_events
  
  validates_presence_of :name
  
end
