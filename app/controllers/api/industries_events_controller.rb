class Api::IndustriesEventsController < ApplicationController
  respond_to :json

  def index
    @industriesevents = IndustryEvent.all.map { |i| IndustryEventSerializer.new(i).serializable_hash }
    render json: {
                    success: true,
                    response: @industriesevents
                  }
  end
end