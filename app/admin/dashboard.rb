ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Recently registered voluneteers" do
          table_for User.order(created_at: :desc) do
            # column :name
            column :email
            column "Registered at", :created_at
            #column "View" do |user|
              #link_to "View profile", user_path(user)
            #end
          end
        end
      end
      
      column do
        panel "Recent posts" do
          table_for Post.order(updated_at: :desc) do
            column :title
            column :updated_at
            column :thread_type
            column "View" do |post|
              link_to "View post", post_path(post) #will need to change once Post is linked to User
            end
          end
        end
      end
    end

  end
end
