class Attendance < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  scope :attending, -> { where(status: true) }
end
