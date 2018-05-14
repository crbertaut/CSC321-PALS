ActiveAdmin.register Donation do
    menu priority: 4
    permit_params :user_id, :organization_id, :amount, :date
    
    config.sort_order = 'date_desc'
    index title: 'Donations' do
        selectable_column
        column "Date" do |don|
            link_to don.date.strftime("%B %d, %Y"), admin_donation_path(don)
        end
        column "Amount" do |don|
            number_with_precision(don.amount, :precision => 2)
        end
        column "Donor" do |don|
            if (don.user_id) then
                user = User.find_by id: don.user_id
                link_to "#{user.name}", admin_volunteer_path(user)
            elsif (don.organization_id) then
                org = Organization.find_by id: don.organization_id
                link_to "#{org.name}", admin_organization_path(org)
            end
        end
        actions defaults: false do |don|
          button_to('Edit', edit_admin_donation_path(don), method: :get, class: "purple", style:"font-size:0.8em;padding:5px 10px") +
          button_to('Delete', admin_donation_path(don), data: { confirm: "Are you sure you want to delete this?" }, method: :delete, class: "red", style:"font-size:0.8em;padding:5px 10px")
        end
    end

    filter :user, label: "Donor", collection: proc { User.all + Organization.all }
    filter :amount, as: :range_select
    filter :date
    
    
    form do |f|
      f.inputs do
        f.input :user, collection: User.all
        f.input :organization, collection: Organization.all
        f.input :amount
        f.input :date, as: :date_time_picker,  
              picker_options: {  
               min_date: '2007/01/01',
               max_date: Date.current,
               timepicker: false
              }  
      end
      f.actions
    end
    
    controller do 
        def create
            if (params[:donation][:user_id] != 0) then
                donor = User.find_by id: params[:donation][:user_id]
            end
        end
    end
    # controller do
    #   def update
    #     int_original = Interest.find_by id: params[:id]
    #     int = params[:interest][:name].strip.downcase.capitalize
    #     if (Interest.find_by name: int) == nil
    #       int_original.update(name: int)
    #       flash[:notice] = "Interest was successfully updated."
    #       redirect_to admin_interests_path
    #     else
    #       flash[:notice] = "Interest already exists!"
    #       redirect_to admin_interests_path
    #     end
    #   end
    #   def create
    #     int = params[:interest][:name].strip.downcase.capitalize
    #     if (Interest.find_by name: int) == nil
    #       Interest.create!(name: int)
    #       flash[:notice] = "Interest was successfully created."
    #       redirect_to admin_interests_path
    #     else
    #       flash[:notice] = "Interest already exists!"
    #       redirect_to admin_interests_path
    #     end
    #   end
    # end
end