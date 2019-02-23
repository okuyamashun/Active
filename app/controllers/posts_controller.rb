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
		@comments = @post.comments
		@search = Post.ransack(params[:q])
		@favorites = Favorite.new
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id
		if @post.save
			redirect_to posts_path
		else
			redirect_to posts_path(@post.id)
	    end
	end

	def index
		@posts = Post.page(params[:page]).reverse_order
		@user = current_user
		@search = Post.ransack(params[:q])
	end

	def destroy
		@post = Post.find(params[:id])
    	@post.destroy
    	redirect_to posts_path
	end
	def search
		@search = Post.ransack(params[:q])
		@search.sorts = 'id asc' if @search.sorts.empty?
		@searchs = @search.result(distinct: true)
	end


private
	def post_params
		params.require(:post).permit(:location, :genre, :title, :posted_details, images:[], comment_attributes: [ :comment, :created_at ])
		
	end

	def search_params
		params.require(:q).permit!
	end

	def comment_params
		params.require(:comment).permit(:comment, :created_at )
	end
end
