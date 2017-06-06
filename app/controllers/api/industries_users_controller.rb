class Api::IndustriesUsersController < ApplicationController
  respond_to :json

  def index

    @industriesusers = IndustryUser.all.map { |i| IndustryUserSerializer.new(i).serializable_hash }
    render json: {
                    success: true,
                    response: @industriesusers
                  }
  end

  def create
   @industriesusers = IndustryUser.new(industriesusers_params)
   if @industriesusers.save
       render json: {
                    success: true,
                    response: @industriesusers
                  }
      else
        render json: {
                        success: false,
                        info:@industriesusers.errors.to_json
                      }
      end  
  end

def industriesusers_params
  params.permit(:industry_id, :user_id)
end

end