ActiveAdmin.register Industry do
  controller do
    skip_before_filter :authenticate_user!
  end
  permit_params :name
end
