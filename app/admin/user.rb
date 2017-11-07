ActiveAdmin.register User do
    permit_params :email, :password, :password_confirmation
    
    menu priority: 2
    menu label: "Volunteers"

    
    index title: 'Volunteers' do
        selectable_column
        id_column
        column :email
        column :posts
        actions
    end
    
    filter :email
    filter :created_at

    form do |f|
        f.inputs do
            f.input :email
            f.input :password
            f.input :password_confirmation
        end
        f.actions
    end
end