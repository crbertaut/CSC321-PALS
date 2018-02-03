class PostsController < ApplicationController
  include ApplicationHelper
  before_action :auth_user!, except: :index
  
  def post_params
    params.require(:post).permit(:title, :date, :description, :user_id, :username)
  end

  def show
    id = params[:id] # retrieve post ID from URI route
    @post = Post.find(id) # look up post by unique ID
  end

  def index
    @all_types = ['Shift', 'Ride', 'Other']
		if params.key?(:sort_by)
			session[:sort_by] = params[:sort_by]
		elsif session.key?(:sort_by)
			redirect_to sort_by: session[:sort_by] and return
		end
		
		if params.key?(:types)
			session[:types] = params[:types]
		elsif session.key?(:types)
			redirect_to types: session[:types] and return
		end
		
		@checked_types = (session[:types].keys if session.key?(:types)) || @all_types
    @posts = Post.where(thread_type: @checked_types).order(session[:sort_by])
    if session[:sort_by] == 'title'
      @posts = @posts.reverse
    end
  end

  # default: render 'new' template
  def new
    if admin_user_signed_in?
      flash[:notice] = "You are currently signed in as admin. Please create posts through the admin dashboard."
      redirect_to posts_path
    end
  end

  def create
    @post = current_user.posts.create!(post_params)
    @post.update(username: User.find(@post.user_id).username)
    @post.update(thread_type: params[:thread_type])
    flash[:notice] = "Post was created successfully."
    redirect_to posts_path
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    @post = Post.find params[:id]
    @post.update_attributes!(post_params)
    @post.update(thread_type: params[:thread_type])
    @post.update(username: User.find(@post.user_id).username)
    flash[:notice] = "Post was updated successfully."
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Post deleted."
    redirect_to posts_path
  end

end