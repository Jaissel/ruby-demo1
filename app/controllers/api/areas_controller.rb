class Api::AreasController < ApplicationController
  respond_to :json

  def index

    @areas = IndustryArea.all.map { |i| IndustryAreaSerializer.new(i).serializable_hash if ! i.area.nil?}.compact
    render json: {
                    success: true,
                    response: @areas
                  }
  end
end
