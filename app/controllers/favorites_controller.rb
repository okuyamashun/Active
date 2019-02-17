class FavoritesController < ApplicationController
	before_action :authenticate_user!

	def create
		
		@favorite = current_user.favorites.create(post_id: params[:post_id])
    	redirect_back(fallback_location: post_path(params[:post_id]) )
	end

	def destroy
	
		@favorite = Favorite.find_by(post_id: params[:post_id], user_id: current_user.id)
	    @favorite.destroy
	    redirect_back(fallback_location: post_path(params[:post_id]) )
	end
end
