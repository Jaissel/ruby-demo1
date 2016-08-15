class IndustryAreaUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :industry_area

  validates_presence_of :user_id, :industry_area_id
end
