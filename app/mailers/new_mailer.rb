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
    @url = Rails.env.production? ? 'http://nwmeeting.com/' : 'http://localhost:3000/'
    @url += "password/edit.#{@user.id}?reset_password_token=#{@user.reset_password_token}"
    mail(to: @user.email, subject: 'Reset Password.')

  end

  def remembering_event(event_id, message)
    @message = message
    @event = Event.find_by(id: event_id)
    @url = Rails.env.production? ? 'http://nwmeeting.com/' : 'http://localhost:3000/'
    if ! @event.nil? &&  ! @event.place.nil? && !@event.place.place_emails.nil? 
      puts "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
      puts to_email(@event.place.place_emails)
      current_email = to_email(@event.place.place_emails)
      mail(to: current_email, from: 'info@nwmeeting.com', subject: "Remembering - #{message} #{@event.name}.") if ! current_email.empty?
    end
  end

  private

  def to_email(emails)
    list = []
    validate = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    emails.each do | email |
      list.push(email.email) if !(email.email =~ validate).nil?
    end
    list
  end
end
