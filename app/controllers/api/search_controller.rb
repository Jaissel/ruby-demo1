class Api::SearchController < ApplicationController
  respond_to :json
  before_action :find_events_by_areas, only: [:by_areas]
  before_action :find_events_by_industries, only: [:by_industries]

  def by_text
    @events_by_text = Event.all.match_name(params[:text])
    @events = events_serialized(@events_by_text)
    render :json => { :success => true,
                      :response => @events
                    }
  end

  def by_areas
    render :json => { :success => true,
                      :response => @events
                    }
  end

  def by_industries
    render :json => { :success => true,
                      :response => @events
                    }
  end

  private

  def find_events_by_areas
    @areas_ids = params[:areas_ids].split(',')
    @events_by_areas = []
    @industry_area_ids = []

    @areas_ids.each do |area_id|
      IndustryArea.where(area_id: area_id.to_i).map { |ia| @industry_area_ids << ia.id }
    end

    @industry_area_ids.each do |industry_area_id|
      IndustryAreaEvent.where(industry_area_id: industry_area_id).map { |iae| @events_by_areas << iae.event }
    end

    @events = events_serialized(@events_by_areas)
  end

  def find_events_by_industries
    @industries_ids = params[:industries_ids].split(',')
    @events_by_industries = []
    @industry_area_ids = []

    @industries_ids.each do |industry_id|
      IndustryArea.where(industry_id: industry_id.to_i).map { |ia| @industry_area_ids << ia.id  }
    end

    @industry_area_ids.each do |industry_area_id|
      IndustryAreaEvent.where(industry_area_id: industry_area_id).map { |iae| @events_by_industries << iae.event }
    end

    @events = events_serialized(@events_by_industries)
  end

  def events_serialized(events)
    events.map { |e| EventSerializer.new(e).serializable_hash }
  end

end
