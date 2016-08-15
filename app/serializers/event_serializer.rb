class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :schedule, :avatar, :cover, :capacity
  belongs_to :place
end
