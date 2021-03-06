class UserSerializer < ActiveModel::Serializer

  attributes :id, :name,:last_name, :profile, :avatar, :profile, :location, :company, :position, :phone, :email, :authentication_token, :industries, :areas, :status

  def avatar
    if object.image.url == "/images/original/missing.png"
      object.avatar.present? ? object.avatar : nil
    else
      object.image 
    end
  end 
end