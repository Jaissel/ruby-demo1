#table "users"
#t.string   "email",                  limit: 255, default: "", null: false
#t.string   "encrypted_password",     limit: 255, default: "", null: false
#t.string   "name",                   limit: 255,              null: false
#t.string   "last_name",              limit: 255,              null: false
#t.string   "avatar",                 limit: 255,              null: false
#t.string   "profile",                limit: 255,              null: false
#t.string   "phone",                  limit: 255,              null: false
#t.string   "reset_password_token",   limit: 255
#t.datetime "reset_password_sent_at"
#t.datetime "remember_created_at"
#t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
#t.datetime "current_sign_in_at"
#t.datetime "last_sign_in_at"
#t.string   "current_sign_in_ip",     limit: 255
#t.string   "last_sign_in_ip",        limit: 255
#t.datetime "created_at",                                      null: false
#t.datetime "updated_at",                                      null: false


class User < ActiveRecord::Base
  acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :industry_area_users
  has_many :industries, through: :industry_area_users
  has_many :attendances

  validates_presence_of :name, :last_name, :profile, :email


  def self.find_for_linkedin_oauth(access_token, signed_in_resource=nil, provider)
    data = access_token.info
    identity = Identity.find_for_oauth(access_token)

    user = signed_in_resource ? signed_in_resource : identity.user
    if user.nil?
      email = data.email ? data.email : "#{uid}@withoutemail.com"
      user = User.create!(email: email, name: data.first_name, last_name: data.last_name, password: Devise.friendly_token[0,20], avatar: data.image, phone: data.phone, profile: data.urls.public_profile)
    end

    if identity.user != user
      identity.user = user
      identity.save!
    end
    user
  end
end
