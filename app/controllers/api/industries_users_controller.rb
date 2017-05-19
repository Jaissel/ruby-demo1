class Api::IndustriesUsersController < ApplicationController
  respond_to :json

  def index

    @industriesusers = IndustryUser.all.map { |i| IndustryUserSerializer.new(i).serializable_hash }
    render json: {
                    success: true,
                    response: @industriesusers
                  }
  end
end
