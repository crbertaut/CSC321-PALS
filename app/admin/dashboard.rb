ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Recently registered volunteers" do
          table_for User.order(created_at: :desc) do
            column :username
            column :name
            column :email
            column "Registered at", :created_at
            column "View" do |user|
              link_to "View profile", admin_volunteer_path(user)
            end
          end
        end
      end
    end
  end
end
