class Api::IndustriesController < ApplicationController
  before_action :set_industry, only: [:users]
  respond_to :json

  def index
    @industries = Industry.all.map { |i| IndustrySerializer.new(i).serializable_hash }
    render json: {
                    success: true,
                    response: @industries
                  }
  end

  def events
    @events = @industry.events.map { |a| eventserializer.new(a).serializable_hash }
    if @industry.errors.empty?
      render json: {
                      success: true,
                      response: @events
                    }
    else
      render json: {
                      success: false,
                      info: @industry.errors.to_json
                    }
    end
  end

  def users
    @users = @industry.users.map { |a| userserializer.new(a).serializable_hash }
    if @industry.errors.empty?
      render json: {
                      success: true,
                      response: @users
                    }
    else
      render json: {
                      success: false,
                      info: @industry.errors.to_json
                    }
    end
  end

  def destroy
    @industry.destroy
    if @industry.errors.empty?
      render json: {
                      success: true,
                      response: @industry.to_json
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
