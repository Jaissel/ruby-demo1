ActiveAdmin.register PlaceEmail do
  menu parent: 'places'
  controller do
    skip_before_filter :authenticate_user!
  end
  permit_params :email, :place_id

  form do |f|
    f.inputs "Place Email Details" do
      f.input :email
      f.input :place_id, :label => "Place", :include_blank => false, :as => :select, :collection => Place.all.collect {|p| [p.name, p.id]}
    end
    f.actions
   end
end

