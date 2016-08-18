class UserSerializer < ActiveModel::Serializer
  attributes :id, :name,:last_name, :profile, :avatar, :profile, :phone, :email, :industry, :area

  def industry
    industry_area_user = object.industry_area_users.first
    industry_area = IndustryArea.find(industry_area_user.industry_area_id)
    IndustrySerializer.new(industry_area.industry).serializable_hash
  end

  def area
    industry_area_user = object.industry_area_users.first
    industry_area = IndustryArea.find(industry_area_user.industry_area_id)
    AreaSerializer.new(industry_area.area).serializable_hash
  end
end
