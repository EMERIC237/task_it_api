class DailyPlansController < ApplicationController
  before_action :set_daily_plan, only: [:show, :update, :destroy]
  before_action :set_user, only: [:create, :index]

  def index
    daily_plans = @user.daily_plans
    render json: daily_plans
  end

  def show
    render json: @daily_plan
  end

  def create
    daily_plan = @user.daily_plans.build(daily_plan_params)
    if daily_plan.save
      render json: daily_plan, status: :created
    else
      render json: { error: "Could not create daily plan" }, status: :unprocessable_entity
    end
  end

  def update
    if @daily_plan.update(daily_plan_params)
      render json: @daily_plan
    else
      render json: { error: "Daily plan could not be updated" }, status: :unprocessable_entity
    end
  end

  def destroy
    @daily_plan.destroy
    render json: { message: "Daily plan deleted successfully" }, status: :ok
  rescue StandardError => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  private

  def daily_plan_params
    params.require(:daily_plan).permit(:date)
  end

  def set_daily_plan
    @daily_plan = DailyPlan.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
