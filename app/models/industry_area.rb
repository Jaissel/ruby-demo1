class IndustryArea < ActiveRecord::Base
  belongs_to :area
  belongs_to :industry
end
