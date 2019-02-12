class PostsController < ApplicationController

	before_action :authenticate_user!

	def new
		@user = current_user
		@post = Post.new
		@post.images.build
	end

	def show
		@post = Post.find(params[:id])
		@images = @post.images.build
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id
		if @post.save
			redirect_to posts_path(@post.id)
		else
			render :new
	    end
	end

	def index
		@posts = Post.page(params[:page]).reverse_order

	end

	def destroy
		@post = Post.find(params[:id])
    	@post.destroy
    	redirect_to :index
	end

private
	def post_params
		params.require(:post).permit(:location, :genre, :title, :posted_details, images:[], comment_attributes: [ :comment, :created_at ])
	end

	def comment_params
		params.require(:comment).permit(:comment, :created_at )
	end
end
