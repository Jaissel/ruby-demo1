ActiveAdmin.register Event do
  menu parent: 'events'
  controller do
    skip_before_filter :authenticate_user!
  end

  permit_params :name, :description, :schedule, :avatar, :cover, :capacity, :place_id, :admin_user_id

  form do |f|
    f.inputs "Event Details" do
      f.input :name
      f.input :description
      f.input :schedule,      as: :datetime_picker
      f.input :avatar, :required => false, :as => :file
      f.input :cover, :required => false, :as => :file
      f.input :capacity
      f.input :place, :label => "Places", :include_blank => false, :as => :select, :collection => Place.all.collect {|p| [p.name, p.id]}
      f.input :admin_user_id, :input_html => { :value => current_admin_user.id }, as: :hidden
    end
    f.actions
   end

  show do |e|
    attributes_table do
      row :name
      row :description
      row :schedule
      row :avatar do
        image_tag(e.avatar.url)
      end
      row :cover do
        image_tag(e.cover.url)
      end
      row :capacity
      row :place
      row :admin_user
    end
  end

end
