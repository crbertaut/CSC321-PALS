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
        column :posts #link to fitered posts by user
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
            f.input :name, required: true
            f.input :username, required: true
            if request.original_url.end_with?("new")
                f.input :password, required: true
            else 
                f.input :password, required: false
            end
            f.input :email, required: false
            f.input :phone
            f.input :dob
            f.input :interests, as: :check_boxes
            f.input :other_interests, as: :string
        end
        f.actions
        para "Press cancel to return to the list without saving."
    end
end