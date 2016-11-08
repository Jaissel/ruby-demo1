#t.string   "name",       null: false
class City < ActiveRecord::Base
  has_many :places
  belongs_to :state
  validates_presence_of :name

end
