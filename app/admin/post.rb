ActiveAdmin.register Post do
    menu priority: 3
    
    permit_params :title, :description, :thread_type
    
    index title: 'Posts' do
      selectable_column
      id_column
      column :title
      column "Content", :description
      column "Type", :thread_type
      column :user
      column "Date of event", :date
      column "Replies" do |post|
        link_to "See replies", admin_post_replies_path(post)
      end
      actions
    end
    
    filter :title
    filter :thread_type, as: :select, label: "Post type"
    filter :date, label: "Date of event"
    filter :user
    
    show do
        attributes_table do
            row :title
            row :thread_type
            row :description
            row "Volunteer", :user
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
            f.input :description, label: "Content"
            f.input :thread_type, label: "Post type", :collection => ['Shift', 'Ride', 'Other']
            f.input :date, as: :date_select, label: "Date"
        end
        f.actions
        para "Press cancel to return to the list without saving."
    end
end