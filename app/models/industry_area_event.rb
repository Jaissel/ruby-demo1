class IndustryAreaEvent < ActiveRecord::Base
  belongs_to :event
  belongs_to :industry_area

  validates_presence_of :event_id, :industry_area_id
end
