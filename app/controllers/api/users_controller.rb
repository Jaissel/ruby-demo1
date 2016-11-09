class Api::UsersController < ApplicationController
  before_action :set_user, only: [:destroy, :show, :attendances, :attending, :not_attending]
  respond_to :json

  def show
    if !@user.nil?
      render json: {
                      success: true,
                      response: UserSerializer.new(@user).serializable_hash
                    }
    else
      render json: {
                      success: false,
                      info: "The user doesn't exist."
                    }
    end
  end

  def destroy
    @user.destroy
    if @user.errors.empty?
      render json: {
                      success: true,
                      response: @user.to_json
                    }
    else
      render json: {
                      success: false,
                      info: @user.errors.to_json
                    }
    end
  end

  def attendances
    if !@user.nil?
      events_serialized = @user.attendances.map { |a| EventSerializer.new(a.event, current_user: @user).serializable_hash }
      render json: {
                      success: true,
                      response: events_serialized
                    }
    else
      render json: {
                      success: false,
                      info: "The user doesn't exist."
                    }
    end
  end

  def attending
    if !@user.nil?
      events_serialized = @user.attendances.attending.active_events.map { |a| EventSerializer.new(a.event, current_user: @user).serializable_hash }
      render json: {
                      success: true,
                      response: events_serialized
                    }
    else
      render json: {
                      success: false,
                      info: "The user doesn't exist."
                    }
    end
  end

  def not_attending
    if !@user.nil?
      events_serialized = @user.attendances.not_attending.active_events.map { |a| EventSerializer.new(a.event, current_user: @user).serializable_hash }
      render json: {
                      success: true,
                      response: events_serialized
                    }
    else
      render json: {
                      success: false,
                      info: "The user doesn't exist."
                    }
    end
  end

  private
    def set_user
      @user = User.find(params[:id].nil? ? params[:user_id] : params[:id])
    end
end
