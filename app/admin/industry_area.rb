ActiveAdmin.register IndustryArea do
  controller do
    skip_before_filter :authenticate_user!
  end
  permit_params :industry_id, :area_id

  form do |f|
    f.inputs "Industry Area Details" do
      f.input :industry, :label => "Places", :include_blank => false, :as => :select, :collection => Place.all.collect {|p| [p.name, p.id]}
      f.input :area, :label => "Places", :include_blank => false, :as => :select, :collection => Place.all.collect {|p| [p.name, p.id]}
    end
    f.actions
   end
end
