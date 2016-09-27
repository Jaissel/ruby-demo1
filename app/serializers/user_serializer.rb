class UserSerializer < ActiveModel::Serializer
  attributes :id, :name,:last_name, :profile, :avatar, :profile, :phone, :email, :industries, :areas

  def industries
    @event_industries = []
    object.industry_area_users.each do |iau|
      industry_area = IndustryArea.find(iau.industry_area_id)
      @event_industries << IndustrySerializer.new(industry_area.industry).serializable_hash
    end
    @event_industries
  end

  def areas
    @event_areas = []
    object.industry_area_users.each do |iau|
      industry_area = IndustryArea.find(iau.industry_area_id)
      @event_areas << AreaSerializer.new(industry_area.area).serializable_hash
    end
    @event_areas
  end
end
