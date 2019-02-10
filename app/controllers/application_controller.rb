class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end


	def after_sign_in_path_for(resource)
    	user_path(current_user)
	end

	def after_sign_up_path_for(resource)
		edit_user_path(current_user)
	end


	protected

	def configure_permitted_parameters
	    added_attrs = [ :name, :email, :password, :password_confirmation　]
	    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
	    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
	    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
	end
end
