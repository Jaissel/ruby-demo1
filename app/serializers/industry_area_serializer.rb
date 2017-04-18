class IndustryAreaSerializer < ActiveModel::Serializer
  attributes :id, :name, :industry_id

  def id
    
    if !object.area.nil?
  	  object.area.id
  	else
  	  nil
  	end
  end

  def name
  	if !object.area.nil?
  	  object.area.name
  	else
  	  nil
  	end
    
  end
end
