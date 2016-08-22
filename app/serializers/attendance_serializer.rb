class AttendanceSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :event_id, :status
end
