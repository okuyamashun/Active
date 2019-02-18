class FollowsController < ApplicationController

	before_action :authenticate_user!

	def create
	  @user  = User.find(params[:following_id])
      @users = @user.following
      current_user.follow(@user)
      redirect_to user_path(@user)
	end

	def destroy
	  @user  = User.find_by(params[:follower_id])
      @users = @user.followers
      current_user.unfollow(@user)
      redirect_to user_path(@user)
	end
end
