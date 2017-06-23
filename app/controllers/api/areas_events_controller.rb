class Api::AreasEventsController < ApplicationController
  respond_to :json

  def index

    @areaevent = AreaEvent.all.map { |i| AreaEventSerializer.new(i).serializable_hash }
    render json: {
                    success: true,
                    response: @areaevent
                  }
  end

  def create
   @areaevent = AreaEvent.new(areaevents_params)
   if @areaevent.save
       render json: {
                    success: true,
                    response: @areaevent
                  }
      else
        render json: {
                        success: false,
                        info:@areaevent.errors.to_json
                      }
      end  
  end

def areaevents_params
  params.permit(:area_id, :event_id)
end
  
end
