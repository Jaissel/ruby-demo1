ActiveAdmin.register Event do
  controller do
    skip_before_filter :authenticate_user!
  end
  
end
