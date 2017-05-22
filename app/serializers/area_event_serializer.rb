class AreaEventSerializer < ActiveModel::Serializer
  attributes :id, :area, :event

  def area
    AreaSerializer.new(object.area).serializable_hash
  end

  def event
    EventSerializer.new(object.event, current_user: instance_options[:current_user]).serializable_hash
  end
end
