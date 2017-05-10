class IndustryEvent < ActiveRecord::Base
    belongs_to :industry
	belongs_to :event
end
