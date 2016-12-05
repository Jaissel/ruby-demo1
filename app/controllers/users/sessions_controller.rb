class Users::SessionsController < Devise::SessionsController
  skip_before_filter :verify_signed_out_user
  respond_to :json

  def create
    @user = User.find_for_linkedin_sign_up(params)
    if @user.persisted?
      sign_in(resource_name, resource)
      render json: {
                      success: true,
                      response: @user
                    }
    else
      render json: {
                      success: false,
                      info: @user.errors
                    }
    end
  end

	def destroy
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    render json: {
                    success: true,
                    info: "Logged out",
                  }
	end

	private

    def build_resource(*args)
      super
      if session[:omniauth]
        @user.apply_omniauth(session[:omniauth])
        @user.valid?
      end
    end
end
