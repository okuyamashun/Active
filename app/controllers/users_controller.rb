class UsersController < ApplicationController

  before_action :authenticate_user!

	 def show
    @user = User.find(params[:id])
    @post = Post.find(params[:id])
    @post = @user.posts
    @search = Post.ransack(params[:q])
  	end

  	def edit
    @user = User.find(params[:id])
    @search = Post.ransack(params[:q])
  	end

  	def update
  	@user = User.find(params[:id])
  	@user.update(user_params)
  	redirect_to user_path(@user.id)
  	end

  	private

  	def user_params
        params.require(:user).permit(:email, :username, :profile_image, :introduction)
    end
end
