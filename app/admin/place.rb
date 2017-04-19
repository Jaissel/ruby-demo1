ActiveAdmin.register Place do
  menu parent: 'places'
  controller do
    skip_before_filter :authenticate_user!
  end

  permit_params :name, :address, :latitude, :longitude, :city_id, :email

  form do |f|
    f.inputs "Event Details" do
      f.input :name
      f.input :address
      f.input :city, :label => "Cities", :include_blank => false, :as => :select, :collection => City.all.collect {|p| [p.name, p.id]}
      f.inputs "Location", :'data-geousable' => 'yup', :id => 'map_div' do
        f.input :latitude, :input_html => { :id => 'place_latitude' }
        f.input :longitude, :input_html => { :id => 'place_longitude' }
      end
      
      #f.input :email, 'data-role'=>'tagsinput'
    end
    f.actions
   end

  show do |e|
    attributes_table do
      row :name
      row :address
      row :city
      row :latitude
      row :longitude
      row :email
    end
   end

end
