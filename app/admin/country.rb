ActiveAdmin.register Country do
  menu parent: 'places'
  controller do
    skip_before_filter :authenticate_user!
  end
  permit_params :name

  form do |f|
    f.inputs "Country Details" do
      f.input :name
    end
    f.actions
   end
end
