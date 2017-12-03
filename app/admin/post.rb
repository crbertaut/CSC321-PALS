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
      column "Replies" do |post|
        link_to "See replies", admin_post_replies_path(post)
      end
      actions
    end
    
    filter :title
    filter :thread_type
    filter :date
    filter :user
    
    show do
        attributes_table do
            row :title
            row :thread_type
            row :description
            row :user
            row :created_at
            row :updated_at
            row "Replies" do |post|
                table_for post.replies do
                    column :user
                    column :created_at
                    column :updated_at
                    column :message
                    column "View" do
                        link_to "View reply", admin_post_replies_path(post)
                    end
                end
            end
        end
    end

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