class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :schedule, :avatar, :cover, :capacity, :industries, :areas, :admin_user, :users_attending, :users_attending_count, :attending
  belongs_to :place

  def schedule
    object.schedule.strftime("%Y-%m-%d %H:%M")
  end
  
  def users_attending
    object.attendances.attending.map{|a| { id: a.user.id, position: a.user.position, company: a.user.company } unless a.user.nil? }.compact
  end

  def users_attending_count
    object.attendances.attending.count
  end

  def attending
    user_attending = object.attendances.find_by_user_id(instance_options[:current_user].id)
    user_attending.nil? ? false : user_attending.status
  end

end
