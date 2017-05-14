class Api::AreasEventsController < ApplicationController
  respond_to :json

  def index

    @areasevents = AreasEvents.all.map { |i| AreasEventsSerializer.new(i).serializable_hash }
    render json: {
                    success: true,
                    response: @areasevents
                  }
  end
end
