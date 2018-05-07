ActiveAdmin.register Donation do
    menu priority: 4
    permit_params :user_id, :amount, :date
    
    config.sort_order = 'date_desc'
    index title: 'Donations' do
        selectable_column
        column :date
        column "Amount" do |don|
            number_with_precision(don.amount, :precision => 2)
        end
        column "Donor" do |don|
            user = User.find_by id: don.user_id
            if (user.specific.is_a? Person)
                link_to "#{user.name}", admin_volunteer_path(user)
            elsif (user.specific.is_a? Organization)
                link_to "#{user.name}", admin_organization_path(user)
            end
        end
        actions defaults: false do |don|
          button_to('Edit', edit_admin_donation_path(don), class: "purple", style:"font-size:0.8em;padding:5px 10px") +
          button_to('Delete', admin_donation_path(don), data: { confirm: "Are you sure you want to delete this?" }, method: :delete, class: "red", style:"font-size:0.8em;padding:5px 10px")
        end
    end

    filter :user, label: "Donor", collection: proc { User.all + Organization.all }
    filter :amount, as: :numeric_range_filter
    filter :date
    
    
    form do |f|
      f.inputs do
        #f.input "Donor Type", collection: ['Organization', 'Individual'], as: :radio
        f.input :user, label: 'Donor', collection: User.all.order(:name)
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
            Donation.create!(user_id: params[:donation][:user_id], amount: params[:donation][:amount], date: params[:donation][:date])
            flash[:notice] = "Donation was successfully created."
            redirect_to admin_donations_path
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