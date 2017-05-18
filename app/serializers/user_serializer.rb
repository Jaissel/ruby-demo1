class UserSerializer < ActiveModel::Serializer
  attributes :id, :name,:last_name, :profile, :avatar, :profile, :location, :company, :position, :phone, :email, :industries, :areas,

  def industries
    @user_industries = []
    object.industry_users.map{|i| i.industry_user.industry_id}.uniq{ |id| id }.each do |industry_id|
      @user_industries << IndustrySerializer.new(Industry.find(industry_id)).serializable_hash
    end
    @user_industries
  end 

end
