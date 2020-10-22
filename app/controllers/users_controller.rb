class UsersController < ApplicationController
    # before_filter :authenticate_user!
    before_action :find_user, only: [:show, :edit, :update]

    def index
      @users = User.all
    end

    def show
    end

    def new
     
    end

    def edit
      @user.avatar.attach(params[:avatar])
    end

    def create 
      @user.avatar.attach(params[:avatar])
    end

    def update
    end

    private

    def find_user
      if user_signed_in?
      @user = User.find(params[:id])
      else 
        redirect_to new_user_session_path 
      end 
    end

    def user_params
      params.require(:user).permit(:name, :host, :email, :password, :avatar)
    end

end