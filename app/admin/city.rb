ActiveAdmin.register City do
  menu parent: 'places'
  controller do
    skip_before_filter :authenticate_user!
  end
  permit_params :state_id, :name

  form do |f|
    f.inputs "City Details" do
      f.input :name
      f.input :state, :label => "States", :include_blank => false, :as => :select, :collection => State.all.collect {|p| [p.name, p.id]}
    end
    f.actions
   end
end
