ActiveAdmin.register State do
  menu parent: 'places'
  controller do
    skip_before_filter :authenticate_user!
  end
  permit_params :country_id, :name

  form do |f|
    f.inputs "City Details" do
      f.input :name
      f.input :country, :label => "Countries", :include_blank => false, :as => :select, :collection => Country.all.collect {|p| [p.name, p.id]}
    end
    f.actions
   end
end
