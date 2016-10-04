class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :schedule, :avatar, :cover, :capacity, :industries, :areas, :users_attending, :users_attending_count, :admin_user
  belongs_to :place

  def schedule
    object.schedule.strftime("%Y-%m-%d %H:%M")
  end

  def industries
    @event_industries = []
    object.industry_area_events.each do |iae|
      industry_area = IndustryArea.find(iae.industry_area_id)
      @event_industries << IndustrySerializer.new(industry_area.industry).serializable_hash
    end
    @event_industries
  end

  def areas
    @event_areas = []
    object.industry_area_events.each do |iae|
      industry_area = IndustryArea.find(iae.industry_area_id)
      @event_areas << AreaSerializer.new(industry_area.area).serializable_hash
    end
    @event_areas
  end

  def users_attending
    object.attendances.where(status: true)
  end

  def users_attending_count
    object.attendances.where(status: true).count
  end

end
