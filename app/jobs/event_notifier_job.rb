class EventNotifierJob < ActiveJob::Base
  queue_as :default

  def perform(current_event)

  	#current_event = Event.find(event_id)
  	puts "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
  	puts current_event.to_json
 
  	if !current_event.nil?  
	  	NewMailer.delay_until(current_event.schedule.to_datetime + 4.hour - 1.day).remembering_event(current_event, "1 day for event: ")
	  	NewMailer.delay_until(current_event.schedule.to_datetime + 4.hour - 2.hour).remembering_event(current_event, "2 hours for event: ")
		end
  end

end
