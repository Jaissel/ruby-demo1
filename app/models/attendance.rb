class Attendance < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  scope :attending, -> { where(status: true) }
  scope :not_attending, ->  { where(status: false) }

end
