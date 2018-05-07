ActiveAdmin.register Organization do
    menu priority: 5
    
    permit_params [:email, :name, :phone, :shifts_worked]
    
    config.sort_order = 'name_asc'
    index title: 'Organizations' do
      selectable_column
      column :name
      column :email
      column :phone
      column "Shifts" do |org|
        org.shifts_worked
      end
      actions
    end
    
    filter :name
    filter :email
    filter :shifts_worked, as: :numeric_range_filter
    
    form do |f|
      f.inputs do
        f.input :name
        f.input :email
      end
      f.actions
    end
    
    controller do 
      def create
        super
        flash[:notice] = "Organization was successfully created."
        redirect_to admin_organizations_path
      end
    end
end