class Api::EventsController < ApplicationController
  before_action :set_event, only: [:show]
  respond_to :json

  def index
    @events = paginate Event.all, per_page: params[:offset].to_i
    events_serialized = @events.map { |e| EventSerializer.new(e).serializable_hash }
    render json: {
                    success: true,
                    response: events_serialized
                  }
  end


  def show
    if !@event.nil?
      render json: {
                      success: true,
                      response: EventSerializer.new(@event).serializable_hash
                    }
    else
      render json: {
                      success: false,
                      info: "The event doesn't exist."
                    }
    end
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end
end
