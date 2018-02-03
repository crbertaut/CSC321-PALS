class RepliesController < ApplicationController
    include ApplicationHelper
    before_action :auth_user!
    before_action :load_post
        
    def reply_params
        params.require(:reply).permit(:user_id, :message)
    end
    
    def edit
        @reply = @post.replies.find(params[:id])
    end
    
    def create
        if user_signed_in?
            @reply = @post.replies.build(reply_params)
            @reply.username = User.find(@reply.user_id).username
            respond_to do |format|
                if @reply.save
                    format.html { redirect_to @post, notice: "Reply created successfully." }
                    format.js
                else
                    format.html { redirect_to @post, error: "Something went wrong! Reply was not created." }
                    format.js
                end
            end
        elsif admin_user_signed_in?
            flash[:notice] = "You are currently signed in as admin. Please create replies through the admin dashboard."
            redirect_to post_path(@post)
        end
    end
    
    def update
        @reply = @post.replies.find(params[:id])
        if @reply.update_attributes(reply_params)
            @reply.username = User.find(@reply.user_id).username
            redirect_to @post, notice: "Reply updated successfully."
        else
            redirect_to @post, notice: "Something went wrong! Reply was not updated."
        end
    end
    
    def destroy
        @reply = @post.replies.find(params[:id])
        @reply.destroy
        redirect_to @post, notice: "Reply deleted."
    end
    
    private 
    
    def load_post
        @post = Post.find(params[:post_id])
    end
end