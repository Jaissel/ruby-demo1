class Api::IndustriesController < ApplicationController
  before_action :set_industry, only: [:areas]
  respond_to :json

  def index
    @industries = Industry.all.map { |i| IndustrySerializer.new(i).serializable_hash }
    render json: {
                    success: true,
                    response: @industries
                  }
  end

  def areas
    @areas = @industry.areas.map { |a| AreaSerializer.new(a).serializable_hash }
    if @industry.errors.empty?
      render json: {
                      success: true,
                      response: @areas
                    }
    else
      render json: {
                      success: false,
                      info: @industry.errors.to_json
                    }
    end
  end

  private
    def set_industry
      @industry = Industry.find(params[:industry_id])
    end
end
