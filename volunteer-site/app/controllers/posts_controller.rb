class PostsController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Post.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @all_types = ['Shift', 'Ride', 'Other']
		if params.key?(:sort_by)
			session[:sort_by] = params[:sort_by]
		elsif session.key?(:sort_by)
			params[:sort_by] = session[:sort_by]
			redirect_to movies_path(params) and return
		end
		
		if params.key?(:types)
			session[:types] = params[:types]
		elsif session.key?(:types)
			params[:types] = session[:types]
			redirect_to movies_path(params) and return
		end
		
		@checked_types = (session[:types].keys if session.key?(:types)) || @all_types
    @posts = Post.order(session[:sort_by]).where(type: @checked_types)
  end
  
  #Citation: Youtube ruby tutorials 

  def new
    # default: render 'new' template
  end

  def create
    @post = Post.create!(params[:post])
    flash[:notice] = "#{@post.title} was successfully created."
    redirect_to posts_path
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    @post = Post.find params[:id]
    @post.update_attributes!(params[:post])
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