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
end
