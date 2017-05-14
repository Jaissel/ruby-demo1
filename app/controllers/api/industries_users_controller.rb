class Api::IndustriesUsersController < ApplicationController
  respond_to :json

  def index

    @industriesusers = IndustriesUsers.all.map { |i| IndustriesUsersSerializer.new(i).serializable_hash }
    render json: {
                    success: true,
                    response: @industriesusers
                  }
  end
end
