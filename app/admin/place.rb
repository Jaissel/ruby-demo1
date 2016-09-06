ActiveAdmin.register Place do
  controller do
    skip_before_filter :authenticate_user!
  end

  permit_params :name, :address, :latitude, :longitude

  form do |f|
    f.inputs "Event Details" do
      f.input :name
      f.input :address
      f.inputs "Location", :'data-geousable' => 'yup', :id => 'map_div' do
        f.input :latitude, :input_html => { :id => 'place_latitude' }
        f.input :longitude, :input_html => { :id => 'place_longitude' }
      end
    end
    f.actions
   end

  show do |e|
    attributes_table do
      row :name
      row :address
      row :latitude
      row :longitude
    end
   end

end
