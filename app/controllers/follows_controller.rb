class FollowsController < ApplicationController

	before_action :authenticate_user!

	def create
	  @user  = User.find(params[:id])
      @users = @user.following
	end

	def destroy
	  @user  = User.find(params[:id])
      @users = @user.followers
	end
end
