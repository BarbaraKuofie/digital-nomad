class WelcomeController < ApplicationController
    def home 
        if user_signed_in?
            render :home 
        else 
            redirect_to new_user_session_path
        end 

    end 
    
end 