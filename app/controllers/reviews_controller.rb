class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :update, :destroy]
  before_action :set_user, only: [:create, :index]

  def index
    reviews = @user.reviews
    render json: reviews
  end

  def show
    render json: @review
  end

  def create
    review = @user.reviews.build(review_params)
    if review.save
      render json: review, status: :created
    else
      render json: { error: "Could not create review" }, status: :unprocessable_entity
    end
  end

  def update
    if @review.update(review_params)
      render json: @review
    else
      render json: { error: "Review could not be updated" }, status: :unprocessable_entity
    end
  end

  def destroy
    @review.destroy
    render json: { message: "Review deleted successfully" }, status: :ok
  rescue StandardError => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  private

  def review_params
    params.require(:review).permit(:date, :summary, :action_items)
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
