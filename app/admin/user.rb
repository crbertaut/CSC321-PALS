ActiveAdmin.register User, as: 'Volunteer' do
    permit_params do
        params = [:email, :name, :phone, :dob, :username, :password, :password_confirmation, :other_interests, interest_ids:[]]
        params
    end

    menu priority: 2
    
    index title: 'Volunteers' do
        selectable_column
        id_column
        column :name
        column :username
        column :email
        column :phone
        column :posts do |user|
            link_to "View posts", admin_posts_path(q: { user_id_eq: user.id})
        end
        column "Interests" do |user|
            user.interests.collect(&:name)
        end
        actions
    end
    
    filter :name
    filter :username
    filter :email
    filter :created_at
    filter :interests
    
    form do |f| 
        f.inputs do
            f.input :name, input_html: { required: true }
            f.input :username, input_html: { required: true }
            if f.object.new_record?
                f.input :password
                f.input :password_confirmation
            end
            f.input :email, required: false
            f.input :phone
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
                    (User.find_by username: params[:user][:username]).interests << (Interest.find_by name: int)
                end
            end
        end
    end
    
    show do
        attributes_table title: "Profile" do
          row :name
          row :username
          row :email
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
          row "View public profile" do |user|
              link_to user_path(user.id)  # This doesn't work, just refreshes page
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
          row :encrypted_password
          row :reset_password_token
          row :reset_password_sent_at
        end
    end
end