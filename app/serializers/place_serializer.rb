class PlaceSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :longitude, :latitude
  has_many :events
end
