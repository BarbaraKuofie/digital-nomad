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
    end

    def create
    end

    def update
    end

    private

    def find_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :host)
    end

end