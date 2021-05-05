class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
    
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :first_name, :last_name, :password, :is_recruiter])
      devise_parameter_sanitizer.permit(:account_update, keys: [:email, :first_name, :last_name, :password, :is_recruiter, :highest_degree, :address, :is_dark_mode, :phone_number, tag_list: []])
    end
end
