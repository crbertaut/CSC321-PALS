class PostsController < ApplicationController
  before_action :authenticate_user!, except: :index
  
  def post_params
     #params.require(:title).permit(:thread_type, :date, :description, :user_id)
    params.require(:post).permit(:title, :thread_type, :date, :description, :user_id)#.except(:index)
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
  end

  def new
    # default: render 'new' template
  end

  def create
    @post = current_user.posts.create!(post_params)
    flash[:notice] = "#{@post.title} was successfully created."
    redirect_to posts_path
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    @post = Post.find params[:id]
    @post.update_attributes!(post_params)
    flash[:notice] = "#{@post.title} was successfully updated."
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Post '#{@post.title}' deleted."
    redirect_to posts_path
  end

end