class PropertiesController < ApplicationController

    before_action :find_property, only: [:show, :edit, :update]

    def index
      @properties = Property.all
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

    def find_property
      @property = Property.find(params[:id])
    end

    def property_params
      params.require(:property).permit(:title, :address, :city_id, :host_id, :description)
    end

end