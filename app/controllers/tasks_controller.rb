class TasksController < ApplicationController
  # before_action :set_daily_plan, only: [:add_to_plan, :remove_from_plan]
  before_action :set_task, only: [:show, :update, :destroy]
  before_action :set_user, only: [:create, :index]


  def index_all
    tasks = Task.all
    render json: tasks
  end

  def index
    tasks = @user.tasks
    render json: tasks
  end

  def show
    render json: @task
  end

  def create
    new_task = @user.tasks.build(task_params)
    if new_task.save
      render json: new_task, status: :created
    else
      render json: { error: "Could not create the task" }, status: :unprocessable_entity
    end
  end

  def update
    if @task.update(task_params)
      render json: @task
    else
      render json: { error: "Task could not be updated" }, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    render json: { message: "Task deleted successfully" }, status: :ok
  rescue StandardError => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  # def add_to_plan
  #   task = Task.find(params[:task_id])
  #   daily_plan_task = DailyPlanTask.create(daily_plan: @daily_plan, task: task)
  #   if daily_plan_task.persisted?
  #     render json: daily_plan_task, status: :created
  #   else
  #     render json: { error: daily_plan_task.errors.full_messages.to_sentence }, status: :unprocessable_entity
  #   end
  # end

  # def remove_from_plan
  #   daily_plan_task = DailyPlanTask.find_by(daily_plan_id: @daily_plan.id, task_id: params[:task_id])
  #   if daily_plan_task&.destroy
  #     render json: { message: "Task removed from daily plan successfully" }, status: :ok
  #   else
  #     render json: { error: "Could not remove task from daily plan" }, status: :unprocessable_entity
  #   end
  # end

  private

  def task_params
    params.require(:task).permit(:title, :description, :priority, :status, :deadline)
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_daily_plan
    @daily_plan = DailyPlan.find(params[:daily_plan_id])
  end
end
