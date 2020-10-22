class ReviewsController < ApplicationController
    before_action :find_review, only: [:show, :edit, :update, :destroy]

    def index
      @reviews = Review.all
    end

    def show
    end

    def new
      @review = Review.new
    end

    def edit
    end

    def create
      @review = Review.new(review_params)
      if @review.save
        redirect_to property_path(Stay.find(@review.stay.id).property)
      else
        flash[:errors] = @review.errors.full_messages
        redirect_to new_review_path
      end
    end

    def update
      if @review.update(review_params)
        redirect_to property_path(Stay.find(@review.stay.id).property)
      else
        flash[:errors] = @review.errors.full_messages
        redirect_to edit_review_path
      end
    end

    def destroy
      @review.delete
      redirect_to root_path
    end

    private

    def find_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:stay_id, :nomad_id, :description, :rating)
    end

end