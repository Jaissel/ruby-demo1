class EventNotifierJob < ActiveJob::Base
  queue_as :default

  def perform(event_id)

  	current_event = Event.find(event_id)
 
  	if !current_event.nil?  
  		puts "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
  		puts current_event.schedule.to_datetime + 5.hour - 1.day
  		puts current_event.schedule.to_datetime + 5.hour - 2.hour
  		puts "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB"
	  	NewMailer.delay_until(current_event.schedule.to_datetime + 5.hour - 1.day).remembering_event(event_id, "1 day for event: ")
	  	NewMailer.delay_until(current_event.schedule.to_datetime + 5.hour - 2.hour).remembering_event(event_id, "2 hours for event: ")
		end
  end

end
