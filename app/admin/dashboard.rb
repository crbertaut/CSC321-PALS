ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Recently registered volunteers" do
          table_for User.where(actable_type: 'Person').order(created_at: :desc) do
            column :name 
            column :email 
            column "Registered", :created_at 
            column "Details" do |pers|
              button_to("View", admin_volunteer_path(pers), class: "purple", style:"font-size:0.8em;padding:5px 10px")
            end
          end
        end
        panel "Recently registered organizations" do
          table_for User.where(actable_type: 'Organization').order(created_at: :desc) do
            column :name
            column :email 
            column "Registered", :created_at 
            column "Details" do |org|
              button_to("View", admin_organization_path(org), class: "purple", style:"font-size:0.8em;padding:5px 10px")
            end
          end
        end
      end
    end
  end
end
