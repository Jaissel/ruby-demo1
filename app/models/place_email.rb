#t.string   "name",       null: false
class PlaceEmail < ActiveRecord::Base
  belongs_to :place
  validates_presence_of :email

end
