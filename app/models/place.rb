#t.string   "name",       null: false
#t.string   "address",    null: false
class Place < ActiveRecord::Base
  has_many :events
  validates_presence_of :name, :address, :latitude, :longitude

end
