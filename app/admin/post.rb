ActiveAdmin.register Post do
    #belongs_to :user
  
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
    filter :thread_type
    filter :date
    filter :user

    form do |f|
        f.inputs do
            f.input :title
            f.input :description
            f.input :thread_type
            f.input :user
        end
        f.actions
    end
end