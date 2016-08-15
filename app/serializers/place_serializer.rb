class PlaceSerializer < ActiveModel::Serializer
  attributes :id, :name, :address
  has_many :events
end
