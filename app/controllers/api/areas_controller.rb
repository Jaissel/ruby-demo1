class Api::AreasController < ApplicationController
  respond_to :json

  def index

    @areas = Area.all.map { |i| AreaSerializer.new(i).serializable_hash }
    render json: {
                    success: true,
                    response: @areas
                  }
  end

  def events
    @events = @areas.events.map { |a| eventserializer.new(a).serializable_hash }
    if @areas.errors.empty?
      render json: {
                      success: true,
                      response: @events
                    }
    else
      render json: {
                      success: false,
                      info: @areas.errors.to_json
                    }
    end
  end

  def users
    @users = @areas.users.map { |a| userserializer.new(a).serializable_hash }
    if @areas.errors.empty?
      render json: {
                      success: true,
                      response: @users
                    }
    else
      render json: {
                      success: false,
                      info: @areas.errors.to_json
                    }
    end
  end
   def create
    @areas = Area.new(area_params)
    if @areas.save
       render json: {
                    success: true,
                    response: @areas
                  }
      else
        render json: {
                        success: false,
                        info:@areas.errors.to_json
                      }
      end  
  end


  private
    def area_params
    params.permit(:name)
  end
  
  
end

