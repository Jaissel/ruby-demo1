ActiveAdmin.register IndustryAreaEvent do
  menu parent: 'events'
  controller do
    skip_before_filter :authenticate_user!
  end

  permit_params :event_id, :industry_area_id

  form do |f|
    f.inputs "Event Details" do
      f.input :event, :label => "Events", :include_blank => false, :as => :select, :collection => Event.all.active_events.collect {|p| [p.name, p.id]}
      f.input :industry_area, :label => "Industries with Areas", :include_blank => false, :as => :select, :collection => IndustryArea.all.map {|u| ["#{u.industry.name} with #{u.area.name}", u.id]}
    end
    f.actions
   end
end
