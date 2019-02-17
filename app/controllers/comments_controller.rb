class CommentsController < ApplicationController

	before_action :authenticate_user!

	def create
		@post = Post.find(params[:post_id])
		@comment = Comment.new(comment_params)
		@comment.user_id = current_user.id
		@comment.post_id = @post.id
		@comment.save
		redirect_to post_path(@post.id)
	end
	
	def destroy
		@comment = Comment.find(params[:post_id])
		post_id = @comment.post.id
		@comment.delete
		redirect_to post_path(post_id)
	end


	private
	def comment_params
	  params.require(:comment).permit(:user_id, :post_id, :comment)
	end
end
