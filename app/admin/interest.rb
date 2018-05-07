ActiveAdmin.register Interest do
    menu priority: 6
    
    permit_params :interest
    
    config.sort_order = 'name_asc'
    index title: 'Interests' do
      selectable_column
      column "Interests" do |int|
        int.name
      end
      actions
    end

    form do |f|
      f.inputs do
        f.input :name
      end
      f.actions
    end
    
    controller do
      def update
        int_original = Interest.find_by id: params[:id]
        int = params[:interest][:name].strip.downcase.capitalize
        if (Interest.find_by name: int) == nil
          int_original.update(name: int)
          flash[:notice] = "Interest was successfully updated."
          redirect_to admin_interests_path
        else
          flash[:notice] = "Interest already exists!"
          redirect_to admin_interests_path
        end
      end
      def create
        int = params[:interest][:name].strip.downcase.capitalize
        if (Interest.find_by name: int) == nil
          Interest.create!(name: int)
          flash[:notice] = "Interest was successfully created."
          redirect_to admin_interests_path
        else
          flash[:notice] = "Interest already exists!"
          redirect_to admin_interests_path
        end
      end
    end
    
end