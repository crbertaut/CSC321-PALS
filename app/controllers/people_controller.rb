class PeopleController < ApplicationController
    include ApplicationHelper
    before_action :auth_user!
    
    def person_params
        params.require(:name, :password, :email, :gender).permit(:avatar, :dob, 
        :home_phone, :work_phone, :emergency_contact, :emergency_phone, 
        :emergency_phone_other, :emergency_relationship, :organization_id)
    end
    
    def show
        id = params[:id] # retrieve person ID from URI route
        @user = People.find(id) # look up user by unique ID
        respond_to do |format|
            
        format.html
        format.json
        format.pdf {render template: 'people/report', pdf: 'Report' } # Excluding ".pdf" extension.
        end
    end
  
    # GET /users/new
    def new
     #   render layout: "site"
    end
    
    def edit
        @user = current_user
    end
    
    def create
        if (person_params[:type] == true)
            @user = Person.create!(person_params)
            respond_to do |format|
              if @user.save
                format.html { redirect_to @user, notice: 'Person was successfully created.' }
                format.json { render :show, status: :created, location: @user }
              else
                format.html { render :new }
                format.json { render json: @user.errors, status: :unprocessable_entity }
              end
            end
            redirect_to person_path(@user)
        end
    end
end