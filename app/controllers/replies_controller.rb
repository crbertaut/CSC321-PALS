class RepliesController < ApplicationController
    
    #before_action :authenticate_user
    before_action :load_post
    
    def edit
        @reply = @post.replies.find(params[:id])
    end
    
    def create
        @reply = @post.replies.build(reply_params)
        respond_to do |format|
            if @reply.save
                format.html { redirect_to @post, notice: "Reply created successfully" }
                format.js
            else
                format.html { redirect_to @post, error: "Reply has not being created" }
                format.js
            end
        end
    end
    
    def update
        @reply = @post.replies.find(params[:id])
        if @reply.update_attributes(reply_params)
            redirect_to @post, notice: "Reply updated successfully"
        else
            redirect_to @post, notice: "Reply has not being updated"
        end
    end
    
    def destroy
        @reply = @post.replies.find(params[:id])
        @reply.destroy
        redirect_to @post, notice: "Reply has been destroyed successfully"
    end
    
    def reply_params
        params.require(:reply).permit(:user_id, :message)
    end
    
    private 
    
    def load_post
        @post = Post.find(params[:post_id])
    end
end