ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Recently registered voluneteers" do
          User.all.order(created_at: :desc).each do |user|
            li user.email
            li user.created_at
          end
        end
      end
      
      column do
        panel "Recent posts" do
          Post.all.order(created_at: :desc).each do |post|
            li post.title
            li post.date
            li post.thread_type
          end
        end
      end
    end

  end
end
