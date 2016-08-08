class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  respond_to :json

  def linkedin
    @user = User.find_for_linkedin_oauth(request.env["omniauth.auth"], "linkedin")    
    if @user.persisted?
      render json: {
                      :success => true,
                      :user => @user
                    }
    else
      session["devise.linkedin"] = request.env["omniauth.auth"]
      render json: {
                      :success => false,
                      :info => @user.errors
                    }
    end
  end

end
