class Api::AreasUsersController < ApplicationController
  respond_to :json

  def index

    @area_users = AreaUser.all.map { |i| AreaUserSerializer.new(i).serializable_hash }
    render json: {
                    success: true,
                    response: @area_users
                  }
  end

  def create
   @area_users = AreaUser.new(area_users_params)
   if @area_users.save
       render json: {
                    success: true,
                    response: @area_users
                  }
      else
        render json: {
                        success: false,
                        info:@area_users.errors.to_json
                      }
      end  
  end

def area_users_params
  params.permit(:area_id, :user_id)
end

end