class UsersController < ApplicationController
    #before_action :authenticate_user!
    
    def user_params
        params.require(:name, :password, :email, :phone, :dob, :username, :experience).permit(:interests, :username, :experience)
    end
  
    # GET /users/new
    def new
        render layout: "users"
    end
    
    def edit
        @user = current_user
    end
    
    # POST /users
    # POST /users.json
    def create
        @user = User.create!(user_params)
        params[:interests].each do |interest| 
            puts "HELLO"
            @interest = Interest.where(name: interest)
            @user.interests << @interest
        end
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
    
    def show
        id = params[:id]
        @user = User.find(id)
    end
    
end