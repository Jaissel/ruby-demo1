class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_filter :verify_signed_out_user
  respond_to :json

  def linkedin
    @user = User.find_for_linkedin_oauth(request.env["omniauth.auth"], "linkedin")
    if @user.persisted?
      sign_in(resource_name, resource)
      render json: {
                      success: true,
                      response: @user
                    }
    else
      session["devise.linkedin"] = request.env["omniauth.auth"]
      render json: {
                      success: false,
                      info: @user.errors
                    }
    end
  end

end
