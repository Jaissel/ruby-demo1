class Area < ActiveRecord::Base
  has_many :industry_areas, dependent: :destroy
  has_many :industries, through: :industry_areas

  validates_presence_of :name
  
end
