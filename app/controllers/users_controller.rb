class UsersController < ApplicationController

  before_action :authenticate_user!

	 def show
      @user = User.find(params[:id])
      @posts = @user.posts
      @search = Post.ransack(params[:q])
  	end

  	def edit
      @user = User.find(params[:id])
      @search = Post.ransack(params[:q])
  	end

  	def update
    	@user = User.find(params[:id])
    	if @user.update(user_params)
    	   redirect_to user_path(@user.id)
       else
        flash[:notice] = "＊ １文字以上、３０文字以内で入力して下さい ＊"
         redirect_to edit_user_path(@user.id)
      end
  	end

    def favorite
      @search = Post.ransack(params[:q])
      @user = User.find(params[:id])
      @favorites = @user.favorites
    end

    def following
      @search = Post.ransack(params[:q])
      @user  = User.find(params[:id])
      @users = @user.following
      render 'show_follow'
    end

    def followers
      @search = Post.ransack(params[:q])
      @user  = User.find(params[:id])
      @users = @user.followers
      render 'show_follower'
    end

  	private

  	def user_params
        params.require(:user).permit(:email, :username, :profile_image, :introduction)
    end
end
