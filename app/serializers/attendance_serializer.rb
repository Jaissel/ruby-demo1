class AttendanceSerializer < ActiveModel::Serializer
  attributes :id, :user, :event, :status

  def user
    UserSerializer.new(object.user).serializable_hash
  end

  def event
    EventSerializer.new(object.event).serializable_hash
  end
end
