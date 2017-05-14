class Industry < ActiveRecord::Base
  #has_many :industry_industrys, dependent: :destroy
  #has_many :industrys, through: :industry_industrys
  
  has_many :industry_user, dependent: :destroy
  has_many :users, through: :industry_user

  has_many :industry_event, dependent: :destroy
  has_many :events, through: :industry_event

  validates_presence_of :name
  
end
