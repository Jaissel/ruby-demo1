class AreaUserSerializer < ActiveModel::Serializer
  attributes :id, :user, :area

  def user
    UserSerializer.new(object.user).serializable_hash
  end

  def event
    AreaSerializer.new(object.area, current_user: instance_options[:current_user]).serializable_hash
  end
end
