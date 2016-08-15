class Api::IndustryAreaUsersController < ApplicationController
  respond_to :json

  def create
    @industry_area = IndustryArea.find_or_create_by(industry_id: params[:industry_id], area_id: params[:area_id])
    @industry_area_users = IndustryAreaUser.new(user_id: params[:user_id], industry_area_id: @industry_area.id)
    if @industry_area_users.save
      render json: {
                      success: true,
                      response: @industry_area_users.to_json
                    }
    else
      render json: {
                      success: false,
                      info: @industry_area_users.errors.to_json
                    }
    end
  end

end
