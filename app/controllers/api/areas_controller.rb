class Api::AreasController < ApplicationController
  respond_to :json

  def index
    @areas = Area.all.map { |i| AreaSerializer.new(i).serializable_hash }
    render json: {
                    success: true,
                    response: @areas
                  }
  end
end
