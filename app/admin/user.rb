ActiveAdmin.register User, as: 'Volunteer' do
    permit_params do
        params = [:home_email, :name, :phone, :dob, :password, :password_confirmation, :other_interests, interest_ids:[]]
        params
    end
    
    member_action :shifts, method: :get do
        Chartkick.options = { html: '<div id="%{id}" style="height: %{height};">Loading...</div>' }
        render status: 500 unless params.has_key?(:id) and params.has_key?(:sort_by)
        
        groupdate_params = { permit: %w[year quarter month week day hour_of_day] }
        if params[:sort_by] == "hour_of_day"
            groupdate_params[:format] = "%-l %P"
        end
        render json: User.find(params[:id]).shifts
                         .group_by_period(params[:sort_by].downcase, :start,
                                          groupdate_params)
                         .count
    end

    menu priority: 2
    
    index title: 'Volunteers' do
        selectable_column
        id_column
        column :name
        column :home_email
        column :phone
        column "Interests" do |user|
            user.interests.collect(&:name)
        end
        actions
    end
    
    filter :name
    filter :home_email
    filter :created_at
    filter :interests, collection: proc { Interest.all }
    
    form do |f| 
        f.inputs do
            f.input :name, input_html: { required: true }
            if f.object.new_record?
                f.input :password
                f.input :password_confirmation
            end
            f.input :email, required: true
            f.input :home_phone
            f.input :dob, as: :date_select, :start_year => 1900, :end_year => Date.current.year, :use_month_numbers => true, :order => [:year, :month, :day]
            f.input :interests, as: :check_boxes
            f.input :other_interests, as: :string
        end
        f.actions
        para "Press cancel to return to the list without saving."
    end
    
    controller do
        def update
            super
            if params[:user][:other_interests] then
                @int_params = params[:user][:other_interests].split(',')
                @int_params.each do |int|
                    int = int.strip.downcase.capitalize
                    if !(Interest.find_by name: int)
                        Interest.create!(name: int)
                    end
                    (User.find_by id: params[:id]).interests << (Interest.find_by name: int)
                end
            end
        end
        def create
            super
            if params[:user][:other_interests] then
                @int_params = params[:user][:other_interests].split(',')
                @int_params.each do |int|
                    int = int.strip.downcase.capitalize
                    if !(Interest.find_by name: int)
                        Interest.create!(name: int)
                    end
                    (User.find_by id: params[:id]).interests << (Interest.find_by name: int)
                end
            end
        end
    end
    
    show do
        attributes_table title: "Profile" do
          row :name
          row :home_email
          row :phone
          row :dob
          row "Interests" do |user|
            user.interests.collect(&:name)
          end
          row :bio
          row :avatar_file_name
          row :avatar_file_size do |user|
              (user.avatar_file_size.to_f / 1024).ceil.to_s + " KB"  # Convert from bytes to kilobytes
          end
        end
        attributes_table title: "More Details" do
          row :created_at
          row :updated_at
          row :sign_in_count
          row :current_sign_in_at
          row :current_sign_in_ip
          row :last_sign_in_at
          row :last_sign_in_ip
          row :confirmed_at
          row :confirmation_token
          row :confirmation_sent_at
          row :unconfirmed_email
          row :reset_password_token
          row :reset_password_sent_at
        end

        render partial: 'graphs', locals: {day_counts: User.find(params[:id]).shifts.group_by_day(:start).count}
    end
end