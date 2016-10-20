class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :update, :finished, :destroy]
  def index
    @list_of_tasks = Task.all
  end

  def show; end

  def new
    @new_task = Task.new
  end

  def create
    @new_task = Task.new(task_params)

    if @new_task.save
      redirect_to tasks_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @task.update(task_params) #if it saves successfully
      if @task.completion_status == false
        @task.completion_date = nil
        @task.save
      else
        @task.completion_date = Date.current
        @task.save
      end
      redirect_to tasks_path
    else #if it doesn't save
      render :edit
    end
  end

  def finished
    if @task.completion_status == false
      @task.completion_status = true
      @task.completion_date = Date.current
      @task.save
    end
    redirect_to tasks_path
  end

  def destroy
    @task.destroy

    redirect_to tasks_path
  end

  private

  def task_params #will permit and require params we trust
    params.require(:task).permit(:name, :description, :completion_status, :completion_date)
  end

  def find_task
    @task = Task.find(params[:id])
  end
end
