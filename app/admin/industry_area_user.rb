ActiveAdmin.register IndustryAreaUser do
  menu parent: 'industry_areas'
  controller do
    skip_before_filter :authenticate_user!
  end
  permit_params :user_id, :industry_area_id

    index do
    selectable_column
    id_column
    column :user_id
    column :industry_area_id
    actions
  end


  form do |f|
    
    f.inputs "Industry Area Details" do
      f.input :industry_area_id, :label => "Industry Area", :include_blank => false, :as => :select, :collection => IndustryArea.all.collect {|p| [p.industry_area.name, p.id]}
      f.input :user_id, :label => "User", :include_blank => false, :as => :select, :collection => User.all.collect {|p| [p.name, p.id]}
    end

    f.actions
   end
end
