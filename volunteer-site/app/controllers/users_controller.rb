class UsersController < ApplicationController
    
    before_action :authenticate_user!
    
    def user_params
        params.require(:name).permit(:password, :email, :phone)
    end
  
    # GET /users/new
    def new
    end
    
    def edit
        @user = session[:user]
    end
    
    # POST /users
    # POST /users.json
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
    end
    
end
