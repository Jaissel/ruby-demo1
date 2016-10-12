class Api::UsersController < ApplicationController
  before_action :set_user, only: [:destroy, :show, :attendances]
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
      @attendances = @user.attendances.attending.map { |a| AttendanceSerializer.new(a).serializable_hash }
      render json: {
                      success: true,
                      response: @attendances
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
