ActiveAdmin.register Attendance do
  controller do
    skip_before_filter :authenticate_user!
  end
end
