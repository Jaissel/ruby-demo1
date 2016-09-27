class Api::AttendancesController < ApplicationController
  before_action :set_attendance, only: [:destroy]
  respond_to :json

  def create
    @attendance = Attendance.find_or_initialize_by(event_id: params[:event_id], user_id: params[:user_id])
    if @attendance.new_record?
      if @attendance.save
        render json: {
                      success: true,
                      response: AttendanceSerializer.new(@attendance).serializable_hash
                    }
      else
        render json: {
                      success: false,
                      info: @attendance.errors.to_json
                    }
      end
    else
      @attendance.update_attributes(status: !@attendance.status)
      render json: {
                    success: true,
                    response: AttendanceSerializer.new(@attendance).serializable_hash
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
