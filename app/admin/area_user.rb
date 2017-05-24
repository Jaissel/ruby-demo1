ActiveAdmin.register AreaUser do
  menu parent: 'industry_areas'
  controller do
    skip_before_filter :authenticate_user!
  end
  permit_params :user_id, :area_id

  form do |f|
    f.inputs "Area User Details" do
      f.input :user, :label => "User", :include_blank => false, :as => :select, :collection => User.all.collect {|p| [p.name, p.id]}
      f.input :area, :label => "Area", :include_blank => false, :as => :select, :collection => Area.all.collect {|p| [p.name, p.id]}
    end
    f.actions
   end
end
