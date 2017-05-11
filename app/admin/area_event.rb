ActiveAdmin.register AreaEvent do
  menu parent: 'industry_areas'
  controller do
    skip_before_filter :authenticate_user!
  end
  permit_params :event_id, :area_id

  form do |f|
    f.inputs "Area Event Details" do
      f.input :event, :label => "Event", :include_blank => false, :as => :select, :collection => Event.all.collect {|p| [p.name, p.id]}
      f.input :area, :label => "Area", :include_blank => false, :as => :select, :collection => Area.all.collect {|p| [p.name, p.id]}
    end
    f.actions
   end
end
