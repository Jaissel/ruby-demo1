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
  has_many :attendances
  validates_presence_of :name, :description, :schedule, :avatar, :cover, :capacity

  has_attached_file :avatar
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/, :path => "/var/www/html/networking/images/:class/:attachment/:id_partition/:filename"

  has_attached_file :cover
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\z/, :path => "/var/www/html/networking/images/:class/:attachment/:id_partition/:filename"

end
