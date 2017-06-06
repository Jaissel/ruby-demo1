class Area < ActiveRecord::Base
  #has_many :industry_areas, dependent: :destroy
  #has_many :industries, through: :industry_areas
	
  has_many :area_users
  has_many :users, through: :area_users

  has_many :area_events
  has_many :events, through: :area_events

 # belongs_to :area_users
  #belongs_to :area_events
  belongs_to :users

  #has_many :area_users, dependent: :destroy
  #has_many :users, through: :area_users

#  has_many :area_events, dependent: :destroy
#  has_many :events, through: :area_events

  validates_presence_of :name
  
end
