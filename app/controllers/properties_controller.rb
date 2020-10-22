class PropertiesController < ApplicationController

    before_action :find_property, only: [:show, :edit, :update]

    def index
       @properties = Property.all
     
    end

    def show
    end

    def new
      if user_signed_in?
        @property = Property.new
    else
        redirect_to new_user_session_path
    end

    end

    def edit
    end

    def create
      @property = Property.new(property_params)

      if @property.save
        redirect_to property_path(@property)
      else
        flash[:errors] = @property.errors.full_messages
        redirect_to new_property_path
      end

    end

    def update

      if @property.update(property_params)
        redirect_to property_path(@property)
      else
        flash[:errors] = @property.errors.full_messages
        redirect_to edit_property_path
      end

    end

    def destroy
      @property.destroy
      redirect_to root_path

    end

    private

    def find_property
      @property = Property.find(params[:id])
    end

    def property_params
      params.require(:property).permit(:title, :address, :city_id, :host_id, :description, :image)
    end

end