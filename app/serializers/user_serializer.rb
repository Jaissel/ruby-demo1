class UserSerializer < ActiveModel::Serializer
  attributes :id, :name,:last_name, :profile, :avatar, :profile, :location, :company, :position, :phone, :email, :industries, :areas,

  def industries
    @user_industries = []
    object.industry_area_users.map{|i| i.industry_area.industry_id}.uniq{ |id| id }.each do |industry_id|
      @user_industries << IndustrySerializer.new(Industry.find(industry_id)).serializable_hash
    end
    @user_industries
  end

  def areas
    @user_areas = []
    object.industry_area_users.map{|i| i.industry_area.area_id}.uniq{ |id| id }.each do |area_id|
      @user_areas << AreaSerializer.new(Area.find(area_id)).serializable_hash
    end
    @user_areas
  end
end
