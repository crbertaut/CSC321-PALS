class UsersController < ApplicationController
    include ApplicationHelper
    before_action :auth_user!
    
    def user_params
        params.require(:name, :password, :email, :home_phone, :dob).permit(:avatar)
    end
    
    def index
		if params.key?(:sort_users)
			session[:sort_users] = params[:sort_users]
		elsif session.key?(:sort_users)
			redirect_to sort_users: session[:sort_users] and return
		end
		
        @users = User.all.order(session[:sort_users])
    end
  
    def show
        id = params[:id] # retrieve post ID from URI route
        @user = User.find(id) # look up movie by unique ID
        respond_to do |format|
            
            format.html
            format.json
            format.pdf {render template: 'users/report', pdf: 'Report' } # Excluding ".pdf" extension.

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
        @user = User.create!(user_params)
        respond_to do |format|
          if @user.save
            format.html { redirect_to @user, notice: 'Interest was successfully created.' }
            format.json { render :show, status: :created, location: @user }
          else
            format.html { render :new }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end
        redirect_to user_path(@user)
    end
  
    def import 
        User.import(params[:file])
        redirect_to root_url, notice: "Activity Data imported!"
    end
end
