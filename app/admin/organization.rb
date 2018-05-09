ActiveAdmin.register Organization do
    menu priority: 3
    
    permit_params [:email, :name, :phone, :shifts, :password, :password_confirmation]
    
    index title: 'Organizations' do
      selectable_column
      column :name do |org|
          link_to "#{org.name}", admin_organization_path(org)
      end
      column :email
      column :phone
      column :shifts
      actions defaults: false do |org|
          button_to('Edit', edit_admin_organization_path(org), class: "purple", style:"font-size:0.8em;padding:5px 10px") +
          button_to('Delete', admin_organization_path(org), data: { confirm: "Are you sure?" }, method: :delete, class: "red", style:"font-size:0.8em;padding:5px 10px")
      end
    end

    form do |f|
      f.inputs do
        f.input :name
        f.input :email
        f.input :phone
      end
      f.actions
    end
    
end