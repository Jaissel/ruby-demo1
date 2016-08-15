#t.string   "name",        null: false
#t.string   "description", null: false
#t.datetime "schedule",    null: false
#t.string   "avatar",      null: false
#t.string   "cover",       null: false
#t.integer  "capacity",    null: false
#t.integer  "place_id",    null: false
#t.datetime "created_at"
#t.datetime "updated_at"
class Event < ActiveRecord::Base
  belongs_to :place
  validates_presence_of :name, :description, :schedule, :avatar, :cover, :capacity

end
