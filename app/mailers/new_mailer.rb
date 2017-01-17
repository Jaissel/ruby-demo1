class NewMailer < ActionMailer::Base
default from: 'info@nwmeeting.com'

  def contact_email(name, email, message)
    @name = name
    @email = email
    @message = message
    mail(to: 'info@nwmeeting.com', subject: 'New contact email sended.')
  end

  def email_recieved(email)
    @email = email
    mail(to: @email, from: 'info@nwmeeting.com', subject: 'Your email was revieved.')
  end

  def reset_password(user)
    @user = user
    @url = Rails.env.production? ? 'https://http://nwmeeting.com/' : 'http://localhost:3000/'
    @url += "password/edit.#{@user.id}?reset_password_token=#{@user.reset_password_token}"
    mail(to: @user.email, subject: 'Reset Password.')
  end
end
