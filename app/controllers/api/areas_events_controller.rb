class Api::AreasEventsController < ApplicationController
  respond_to :json

  def index

    @areaevent = AreaEvent.all.map { |i| AreaEventSerializer.new(i).serializable_hash }
    render json: {
                    success: true,
                    response: @areaevent
                  }
  end
end
