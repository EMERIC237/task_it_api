class TimeEntriesController < ApplicationController
  before_action :set_time_entry, only: [:show, :update, :destroy]
  before_action :set_task, only: [:create]

  def index
    time_entries = TimeEntry.all
    render json: time_entries
  end

  def show
    render json: @time_entry
  end

  def create
    time_entry = @task.time_entries.build(time_entry_params)
    if time_entry.save
      render json: time_entry, status: :created
    else
      render json: { error: "Could not log time entry" }, status: :unprocessable_entity
    end
  end

  def update
    if @time_entry.update(time_entry_params)
      render json: @time_entry
    else
      render json: { error: "Time entry could not be updated" }, status: :unprocessable_entity
    end
  end

  def destroy
    @time_entry.destroy
    render json: { message: "Time entry deleted successfully" }, status: :ok
  rescue StandardError => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  private

  def time_entry_params
    params.require(:time_entry).permit(:start_time, :end_time, :duration)
  end

  def set_time_entry
    @time_entry = TimeEntry.find(params[:id])
  end

  def set_task
    @task = Task.find(params[:task_id])
  end
end
