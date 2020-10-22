class ApplicationController < ActionController::Base
    # helper_method :starting_date, :ending_date
    before_action :configure_permitted_parameters, if: :devise_controller?

    # def starting_date
    # session[:start_date] = Date.today
    # end

    # def ending_date
    # session[:end_date] = Date.today
    # end

    protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :host, :email, :password, :avatar) }
            devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :host, :email, :password, :current_password, :avatar) }
        end

end
