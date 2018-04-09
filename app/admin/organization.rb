ActiveAdmin.register Organization do
    menu priority: 3
    
    permit_params [:email, :name]
    
    index title: 'Organizations' do
      selectable_column
      column :name
      column :email
      actions
    end

    form do |f|
      f.inputs do
        f.input :name
        f.input :email
      end
      f.actions
    end
    
end