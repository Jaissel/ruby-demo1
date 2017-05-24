class Api::AreasUsersController < ApplicationController
  respond_to :json

  def index

    @areauser = AreaUser.all.map { |i| AreaUserSerializer.new(i).serializable_hash }
    render json: {
                    success: true,
                    response: @areauser
                  }
  end
end
