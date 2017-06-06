class Industry < ActiveRecord::Base

  has_many :industry_user
  has_many :users, through: :industry_user

  has_many :industry_event
  has_many :events, through: :industry_event

  validates_presence_of :name
  
end
