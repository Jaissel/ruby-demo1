class Users::PasswordsController < Devise::PasswordsController
  before_filter :user, only: [:update]


  def edit

    if params[:reset_password_token].nil?
      @user = User.new
      @alert = "Password reset has expired."
    elsif params[:reset_password_token]
      @user = User.find_by(reset_password_token: params[:reset_password_token])
      if !@user
        @user = User.new
        @alert = "Password reset has expired."
      end
    end
    
  end

  def update
    if params[:user][:password].nil? || params[:user][:password_confirmation].nil?
      show_error_by("Your must enter the password and the confirmation")
    elsif params[:user][:password].length  < 8
        show_error_by("Your password must be at least 8 characters")
    elsif params[:user][:password] != params[:user][:password_confirmation]
        show_error_by("Your password and confirmation are different")
    else
        @user.password = params[:user][:password]
        @user.reset_password_token = nil
        @user.save
        redirect_to edit_user_password_path(@user, reset_password_token: params[:user][:reset_password_token]), notice: "The password was successfully updated"
    end
  end

  private
    def show_error_by(message)
      redirect_to edit_user_password_path(@user, reset_password_token: params[:user][:reset_password_token]),alert: message
    end

    def user
      if params[:user][:reset_password_token].nil?
        show_error_by("User no found")
      else
        @user = User.find_by(reset_password_token: params[:user][:reset_password_token])
        if ! @user
          redirect_to edit_user_password_path(@user, reset_password_token: params[:user][:reset_password_token]),alert: "Password reset has expired."
        end

      end 
    end


end