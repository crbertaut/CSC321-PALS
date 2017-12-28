ActiveAdmin.register Post do
    menu priority: 3
    
    permit_params :title, :description, :thread_type
    
    index title: 'Posts' do
      selectable_column
      id_column
      column :title
      column :description
      column :thread_type
      column :user
      column :date
      actions
    end
    
    filter :title
    filter :thread_type, as: :select
    filter :date
    filter :user

    form do |f|
        f.inputs do
            f.input :title
            f.input :description
            f.input :thread_type
        end
        f.actions
        para "Press cancel to return to the list without saving."
    end
end