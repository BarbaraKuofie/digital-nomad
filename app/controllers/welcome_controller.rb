class WelcomeController < ApplicationController
    def home
        if user_signed_in?
            if current_user.host
                render :host_home
            else
                render :nomad_home
            end
        else
            redirect_to new_user_session_path
        end
    end
    

end