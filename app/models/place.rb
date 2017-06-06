#t.string   "name",       null: false
#t.string   "address",    null: false
class Place < ActiveRecord::Base
  has_many :events
  has_many :place_emails
  belongs_to :city
  #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
#	validates :email, 
#          :presence => {:message => "Enter your email address!" },
#          :format => { :with => VALID_EMAIL_REGEX, :message => "Enter a valid Email address !"}
#  validates_presence_of :name, :address, :latitude, :longitude

  
end
