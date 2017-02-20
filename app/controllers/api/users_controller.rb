class Api::UsersController < ApplicationController
  before_action :set_user, only: [:destroy, :show, :update, :attendances, :attending, :not_attending]
  before_action :update_industry_areas, only: [:update]
  skip_before_filter :authenticate_user!, only: [:new_email, :create, :log_in, :create_reset_password]
  before_action :validate_email, only: [:create, :log_in]
  before_filter :find_user_by_email_reset, only: [:create_reset_password]
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

  def update
    if @user.update_attributes(user_params_update)
      render json: {
                    success: true,
                    response: UserSerializer.new(@user).serializable_hash
                  }
    else
      render json: {
                      success: false,
                      info: @user.errors
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

  def new_email
    name = params[:name]
    email = params[:email]
    message = params[:message]
    NewMailer.contact_email(name, email, message).deliver_now
    NewMailer.email_recieved(email).deliver_now
    render json: { success: true }
  end

  def create
    if User.find_by(email: params[:email]).blank?
      @user = User.find_user_sign_up(params_user)

      if @user.save
        sign_in(@user)
        render json: {
                        success: true,
                        response: @user,
                        status: 200
                      }     
      else
        render json: {
                        success: false,
                        info: "Please enter " + @user.errors.collect{|k,v| [k.to_s]}.join(",") + ", please try again",
                        status: 404
                      }
      end
    
    else
      render json: {
                        success: false,
                        info: "Email is already registered, please try again",
                        status: 404
                      }

    end
    
  end

  def log_in
    user = User.find_by(email: params[:email])
    if user
      if user.valid_password?(params[:password]) 
        sign_in(user)
        render json: {
                      success: true,
                      response: user,
                      status: 200
                    }
      else
        render json: {
                      success: false,
                      info: "Invalid password enter the valid password, please try again.",
                      status: 404
                    }
      end

    else
      render json: {
                      success: false,
                      info: "Invalid email, please try again.",
                      status: 404
                    }
    end
  end

  def create_reset_password
    if @user 
      @user.send_password_reset(params) 
      render  :status => 200,
              :json => { :success => true,
                         :info => "Reset password instructions sended.",
                         :reset_password_token => @user.reset_password_token
              }
    end
  end

  private

    def update_industry_areas
      unless params[:user][:industry_areas].nil?
        
        params[:user][:industry_areas].each do |industry_area_param|
          industry_area = IndustryArea.find_or_create_by(industry_id: industry_area_param[:industry_id], area_id: industry_area_param[:area_id])
          if industry_area_param[:destroy]
            industry_area_user = IndustryAreaUser.find_by(user_id: params[:id], industry_area_id: industry_area.id)
            IndustryAreaUser.destroy(industry_area_user.id) unless industry_area_user.nil?
          else
            IndustryAreaUser.find_or_create_by(user_id: params[:id], industry_area_id: industry_area.id)
          end
        end
        
      end

        
    end

    def set_user
      @user = User.find(params[:id].nil? ? params[:user_id] : params[:id])
    end


    def params_user
      params
    end

    def validate_email
      valida_email = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
      if (valida_email =~ params[:email]).nil?
        render json: {
                      success: false,
                      info: "Enter a valid email, please try again.",
                      status: 404
                    }
      end
    end

    def find_user_by_email_reset
    if params[:user].nil? || params[:user][:email].nil?
      render  :status => 404,
              :json => { :success => false,
                         :info => "You must enter the email."
              }
    elsif validate_email_reset(params[:user][:email])
      render  :status => 404,
                :json => { :success => false,
                           :info => "Enter a valid email, please try again."
                }
    else
      
      @user = User.find_by_email(params[:user][:email]) 
      if @user.nil?
        render  :status => 404,
                :json => { :success => false,
                           :info => "The email address is not registered."
                }
      end
    end
  end

  def validate_email_reset(email)
      valida_email = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
      (valida_email =~ email).nil?
  end

  def user_params_update
    params.require(:user).permit(:email, :password, 
      :name, :last_name, :avatar, :profile, 
      :phone, :company, :position, :location, :password)
  end
end
