class ReviewsController < ApplicationController
  before_action :set_reviews, only: [:show, :update, :destroy]

  def index
    @reviews = Review.all
    render json: @reviews
  end

  def show
    render json: @review
  end

  def create
    @review = Review.create(review_params)
    render json: @review
  end

  def update
    review = Review.find(params[:id])
    @review = review.update(review_params)
    render json: @review
  end

  def destroy
    # byebug
    @review.destroy
  end

  private

  def set_reviews
    @review = Review.find(params[:id])
  end

  def review_params
    params.permit(:comment, :user_id, :restaurant_id)
  end
end
