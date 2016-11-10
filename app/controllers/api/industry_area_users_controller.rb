class Api::IndustryAreaUsersController < ApplicationController
  respond_to :json
  before_action :find_or_create_industry_areas

  def create
    render json: {
                    success: true,
                    response: @industry_area_users.to_json
                  }
  end

  private
  def find_or_create_industry_areas
    industry_areas = []
    @industry_area_users = []
    params[:industry_area].each do |industry_area_param|
      industry_areas << IndustryArea.find_or_create_by(industry_id: industry_area_param[:industry_id], area_id: industry_area_param[:area_id])
    end

    industry_areas.each do |industry_area|
      @industry_area_users << IndustryAreaUser.find_or_create_by(user_id: params[:user_id], industry_area_id: industry_area.id)
    end
  end

end
