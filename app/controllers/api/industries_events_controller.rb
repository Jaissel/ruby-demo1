class Api::IndustriesEventsController < ApplicationController
  respond_to :json

  def index
    @industryevent = IndustryEvent.all.map { |i| IndustryEventSerializer.new(i).serializable_hash }
    render json: {
                    success: true,
                    response: @industryevent
                  }
  end

  def create
   @industryevent = IndustryEvent.new(industryevent_params)
   if @industryevent.save
       render json: {
                    success: true,
                    response: @industryevent
                  }
      else
        render json: {
                        success: false,
                        info:@industryevent.errors.to_json
                      }
      end  
  end

def industryevent_params
  params.permit(:industry_id, :event_id)
end

end