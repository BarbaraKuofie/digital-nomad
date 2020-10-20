class ApplicationController < ActionController::Base
    helper_method :user

    def user
        @user = User.find(params[:id])
        session[:user] ||= @user
    end
end
