class PostsController < ApplicationController

	before_action :authenticate_user!

	def new
		@user = current_user
		@post = Post.new
		@post.images.build
		@search = Post.ransack(params[:q])
	end

	def show
		@post = Post.find(params[:id])
		@images = @post.images.build
		@comment = Comment.new(post_id: @post.id)
		@user = current_user
		@search = Post.ransack(params[:q])
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id
		if @post.save
			redirect_to posts_path
		else
			render posts_path
	    end
	end

	def index
		@posts = Post.page(params[:page]).reverse_order
		@user = current_user
		@search = Post.ransack(params[:q])
	end

	def destroy
		@post = Post.find(params[:id])
    	@post.comment.delete
    	redirect_to post_path(@post.id)
	end
	def search
		@search = Post.ransack(params[:q])
		@searchs = @search.result(distinct: true)
	end



private
	def post_params
		params.require(:post).permit(:location, :genre, :title, :posted_details, images:[], comment_attributes: [ :comment, :created_at ])
		params.require(:q).permit!
	end

	def comment_params
		params.require(:comment).permit(:comment, :created_at )
	end
end
