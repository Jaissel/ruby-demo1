ActiveAdmin.register IndustryEvent do
  menu parent: 'industry_areas'
  controller do
    skip_before_filter :authenticate_user!
  end
  permit_params :industry_id, :event_id

  form do |f|
    f.inputs "Industry User Details" do
      f.input :industry, :label => "Industry", :include_blank => false, :as => :select, :collection => Industry.all.collect {|p| [p.name, p.id]}
      f.input :event, :label => "Event", :include_blank => false, :as => :select, :collection => Event.all.collect {|p| [p.name, p.id]}
    end
    f.actions
   end
end
