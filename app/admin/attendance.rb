ActiveAdmin.register Attendance do
  controller do
    skip_before_filter :authenticate_user!
  end
  permit_params :user_id, :event_id, :status
end
