class UserSerializer < ActiveModel::Serializer
  attributes :id, :name,:last_name, :profile, :avatar, :profile, :location, :company, :position, :phone, :email, :industries, :areas
end