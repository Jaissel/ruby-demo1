class IndustryUser < ActiveRecord::Base
    belongs_to :industry
	belongs_to :user

	validates_presence_of :industry_id, :user_id
end
