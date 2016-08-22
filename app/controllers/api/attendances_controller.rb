class Api::AttendancesController < ApplicationController
  before_action :set_attendance, only: [:destroy]
  respond_to :json

  def create
    @attendance = Attendance.new(attendance_params)
    if @attendance.save
      render json: {
                    success: true,
                    response: @attendance.to_json
                  }
    else
      render json: {
                    success: false,
                    info: @attendance.errors.to_json
                  }
    end
  end

  def destroy
    @attendance.destroy
    if @attendance.errors.empty?
      render :json => {
                        success: true,
                        attendance: AttendanceSerializer.new(@attendance).serializable_hash
                      }
    else
      render :json => {
                        success: false,
                        errors: @attendance.errors
                      }
    end
  end

  private

    def set_attendance
      @attendance = Attendance.find(params[:id])
    end

    def attendance_params
      params.require(:attendance).permit(
      :user_id,
      :event_id,
      :status)
    end
end
