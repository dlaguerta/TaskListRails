class TasksController < ApplicationController
  before_action :require_login
  before_action :current_user

  skip_before_action :require_login, only: [:login, :create]
  # before_action :find_task, only: [:show, :edit, :update, :finished, :destroy]
  before_action :find_task, except: [:index, :new, :create]

  def index
    @tasks = @user.tasks
  end

  def show; end

  def new
    @task = Task.new
    @task.user_id = @user.id #should it be uid?
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = @user.id
    if @task.save
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
