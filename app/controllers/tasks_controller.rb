class TasksController < ApplicationController
  before_action :set_task, only: %i{ update destroy }

  def index
    @task = Task.new
    @tasks = Task.all
    @filter = 'all'
    set_active_tasks
  end

  def destroy
    @task.destroy
  end

  def update
    status = params[:status]
    method_to_call = { 'active' => :completed!, 'completed' => :active!}

    @tasks = if Task.valid_status?(status)
      @task.public_send method_to_call[status]
      @task.save

      Task.public_send params[:filter]
    else
      Task.all
    end
    set_active_tasks
    @filter = params[:filter]
  end

  def create
    @task = Task.create task_params
  end

  def filter
    @tasks = Task.public_send Task.valid_status?(params[:filter]) ?
      params[:filter] :
      :all
    @filter = params[:filter]
    set_active_tasks
    render "update"
  end

  private

  def set_task
    @task = Task.find params[:id]
  end

  def task_params
    params.require(:task).permit(:task)
  end

  def set_active_tasks
    @active_tasks = Task.active.count
  end
end