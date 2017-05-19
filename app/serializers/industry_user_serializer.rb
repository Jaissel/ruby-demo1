class IndustryUserSerializer < ActiveModel::Serializer
  attributes :id, :user, :industry

  def user
    UserSerializer.new(object.user).serializable_hash
  end

  def industry
    IndustrySerializer.new(object.industry, current_user: instance_options[:current_user]).serializable_hash
  end
end
