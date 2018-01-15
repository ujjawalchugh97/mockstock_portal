class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

    protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up, keys: [:nameteam, :email, :password, :namep1, :namep2, :contactp1, :contactp2])
            devise_parameter_sanitizer.permit(:account_update, keys: [:nameteam, :email, :password, :current_password, :namep1, :namep2, :contactp1, :contactp2])
        end
end
