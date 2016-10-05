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
  belongs_to :admin_user
  has_many :attendances
  has_many :industry_area_events
  has_many :industry_areas, through: :industry_area_events
  validates_presence_of :name, :description, :schedule, :avatar, :cover, :capacity
  accepts_nested_attributes_for :industry_area_events

  has_attached_file :avatar
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  has_attached_file :cover
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\z/

  scope :match_name, ->(text) { where("lower(name) LIKE ? OR lower(description) LIKE ? ", "%#{text.downcase}%", "%#{text.downcase}%") }

end
