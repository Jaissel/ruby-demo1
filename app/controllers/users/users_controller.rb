class Users::UsersController < ApplicationController
  before_action :set_user, only: [:destroy]
  respond_to :json

  def destroy
    @user.destroy
    if @user.errors.empty?
      render json: {
                      :success => true,
                      :info => "User Deleted",
                      :user => @user.to_json
                    }
    else
      render json: {
                      :success => false,
                      :errors => @user.errors.to_json
                    }
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      accessible = [ :name, :email ]
      params.require(:user).permit(accessible)
    end
end
