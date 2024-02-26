class DailyPlanTasksController < ApplicationController
  def index
    daily_plan = DailyPlan.find(params[:daily_plan_id])
    tasks = daily_plan.tasks
    render json: tasks
  end

  def create
    daily_plan_task = DailyPlanTask.new(daily_plan_task_params)
    if daily_plan_task.save
      render json: daily_plan_task, status: :created
    else
      render json: { error: daily_plan_task.errors.full_messages.to_sentence }, status: :unprocessable_entity
    end
  end



  def destroy
    @daily_plan_task.destroy
    render json: { message: "Task removed from daily plan successfully" }, status: :ok
  end


  
  private

  def set_daily_plan_task
    @daily_plan_task = DailyPlanTask.find(params[:id])
    debugger
  end

  def daily_plan_task_params
    params.require(:daily_plan_task).permit(:daily_plan_id, :task_id, :time_slot_start, :time_slot_end)
  end
end
