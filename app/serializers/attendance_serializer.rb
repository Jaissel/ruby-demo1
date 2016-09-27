class AttendanceSerializer < ActiveModel::Serializer
  attributes :id, :user, :event, :status

  def user
    UserSerializer.new(object.user).serializable_hash
  end
end
