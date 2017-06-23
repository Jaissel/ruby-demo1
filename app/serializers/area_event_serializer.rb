class AreaEventSerializer < ActiveModel::Serializer
  attributes :id, :area_id, :event_id

  def area
    AreaSerializer.new(object.area_id).serializable_hash
  end

  def event
    EventSerializer.new(object.event_id, current_user: instance_options[:current_user]).serializable_hash
  end
end
