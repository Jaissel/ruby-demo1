class IndustryAreaSerializer < ActiveModel::Serializer
  attributes :id, :name, :industry_id

  def id
    object.area.id
  end

  def name
    object.area.name
  end
end
