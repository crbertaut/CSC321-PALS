ActiveAdmin.register AdminUser do
  permit_params :email, :username, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :username
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :username
  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
    end
    f.actions
  end

end
