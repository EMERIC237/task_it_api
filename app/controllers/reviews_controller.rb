class ReviewsController < ApplicationController
  # before_action :set_user, only: [:index, :create]
  before_action :set_task, only: [:create, :index]
  before_action :set_review, only: [:show, :update, :destroy]

  def index
    reviews = @task.reviews
    render json: reviews
  end

  def show
    render json: @review
  end

  def create
    review = @task.reviews.build(review_params)

    if review.save
      render json: review, status: :created
    else
      render json: { errors: review.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reviews/:id
  def update
    if @review.update(review_params)
      render json: @review
    else
      render json: { errors: @review.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /reviews/:id
  def destroy
    @review.destroy
    render json: { message: "Review successfully deleted" }, status: :ok
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

  def set_task
    @task = Task.find(params[:task_id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Task not found" }, status: :not_found
  end
end
