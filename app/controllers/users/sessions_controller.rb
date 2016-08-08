class Users::SessionsController < Devise::SessionsController
  respond_to :json
  
	def destroy
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    render json:  {
                    :success => true,
                    :info => "Logged out",
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
