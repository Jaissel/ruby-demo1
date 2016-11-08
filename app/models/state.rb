#t.string   "name",       null: false
class State < ActiveRecord::Base
  has_many :cities
  belongs_to :country
  validates_presence_of :name

end
