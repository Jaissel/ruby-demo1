ActiveAdmin.register User do
  controller do
    skip_before_filter :authenticate_user!
  end

  permit_params :name, :last_name, :email, :password, :encrypted_password, :reset_password_sent_at, :reset_password_code, :avatar, :profile, :phone, :company, :position, :location

  index do
    selectable_column
    id_column
    column :name
    column :last_name
    column :email
    column :location
    column :company
    column :position
    column :phone
    column :profile
    column :avatar
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :name
  filter :last_name
  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "User Details" do
      f.input :name
      f.input :last_name
      f.input :email
      f.input :avatar
      f.input :profile
      f.input :location
      f.input :company
      f.input :position
      f.input :phone
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
