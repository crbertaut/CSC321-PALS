ActiveAdmin.register User, as: 'Volunteer' do
    permit_params :email, :password, :password_confirmation, :name, :phone, :dob,
        :interests
    
    menu priority: 2
    
    index title: 'Volunteers' do
        selectable_column
        id_column
        column :email
        column :name
        column :phone
        column :posts #link to fitered posts by user
        column "Interests" do |user|
            user.interests.collect(&:name)
        end
        actions
    end
    
    filter :email
    filter :created_at
    filter :interests
    
    form do |f| 
        f.inputs do
            f.input :email
            f.input :name
            f.input :phone
            f.input :dob
            f.input :interests
        end
        f.actions
        para "Press cancel to return to the list without saving."
    end
end