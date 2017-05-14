class Api::IndustriesEventsController < ApplicationController
  respond_to :json

  def index

    @industriesevents = IndustriesEvents.all.map { |i| IndustriesEventsSerializer.new(i).serializable_hash }
    render json: {
                    success: true,
                    response: @industriesevents
                  }
  end
end
