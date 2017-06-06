class IndustryEvent < ActiveRecord::Base
    belongs_to :industry
	belongs_to :event

	validates_presence_of :industry_id, :event_id
end
