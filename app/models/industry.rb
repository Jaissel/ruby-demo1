class Industry < ActiveRecord::Base
  #has_many :industry_industrys, dependent: :destroy
  #has_many :industrys, through: :industry_industrys
  
  has_many :industry_users, dependent: :destroy
  has_many :users, through: :industry_users

  has_many :industry_event, dependent: :destroy
  has_many :events, through: :industry_events

  validates_presence_of :name
  
end
