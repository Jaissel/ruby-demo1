class AreaEvent < ActiveRecord::Base
    belongs_to :area
	belongs_to :event

	validates_presence_of :area_id, :event_id
end
