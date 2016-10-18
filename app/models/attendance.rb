class Attendance < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  scope :attending, -> { where(status: true) }
  scope :not_attending, ->  { where(status: false) }
  scope :active_events, -> { joins(:event).where("events.schedule >= ?", DateTime.now ) }
end
