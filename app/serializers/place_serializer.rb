class PlaceSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :longitude, :latitude, :city, :state, :country
  has_many :events

  def city
    object.city.name unless object.city.nil?
  end

  def state
    object.city.state.name unless object.city.nil? || object.city.state.nil?
  end

  def country
    object.city.state.country.name unless object.city.nil? || object.city.state.nil? || object.city.state.country.nil?
  end
end
