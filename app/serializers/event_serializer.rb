class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :schedule, :avatar, :cover, :capacity, :industries, :areas, :users_attending, :users_attending_count, :admin_user, :attending
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
    object.attendances.attending.map{|a| { id: a.user.id, name: a.user.name } }
  end

  def users_attending_count
    object.attendances.attending.count
  end

  def attending
    user_attending = object.attendances.find_by_user_id(instance_options[:current_user].id)
    user_attending.nil? ? false : user_attending.status
  end

end
