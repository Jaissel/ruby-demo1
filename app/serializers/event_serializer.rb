class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :schedule, :avatar, :cover, :capacity, :latitude, :longitude
  belongs_to :place

  def schedule
    object.schedule.strftime("%Y-%m-%d %H:%M")
  end
end
