class Api::AreasController < ApplicationController
  respond_to :json

  def index
    @areas = IndustryArea.all.map { |i| IndustryAreaSerializer.new(i).serializable_hash }
    render json: {
                    success: true,
                    response: @areas
                  }
  end
end
