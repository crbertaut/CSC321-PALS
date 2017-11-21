ActiveAdmin.register User, as: 'Volunteer' do
    permit_params :email, :password, :password_confirmation, :name, :phone, :dob
    
    menu priority: 2
    
    index title: 'Volunteers' do
        selectable_column
        id_column
        column :email
        column :name
        column :phone
        column :posts
        actions
    end
    
    filter :email
    filter :created_at

    form do |f|
        f.inputs do
            f.input :email
            f.input :name
            f.input :phone
            f.input :password
            f.input :dob
        end
        f.actions
    end
end