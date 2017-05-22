class IndustryEventSerializer < ActiveModel::Serializer
  attributes :id, :industry, :event
  
   def industry
    IndustrySerializer.new(object.industry).serializable_hash
  end

  def event
    EventSerializer.new(object.event, current_user: instance_options[:current_user]).serializable_hash
  end
end
