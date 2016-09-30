class TasksController < ApplicationController
  def index
    @list_of_tasks = Task.all
  end

  def show
    @single_task = Task.find(params[:id])
  end

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

  def edit
    @edit_task = Task.find(params[:id])
  end

  def update
    @edit_task = Task.find(params[:id])
    if @edit_task.update(task_params) #if it saves successfully
      redirect_to tasks_path
    else #if it doesn't save
      render :edit
    end
  end

  def destroy
    @destroy_task = Task.find(params[:id])
    @destroy_task.destroy

    redirect_to tasks_path
  end




  private

  def task_params #will permit and require params we trust
    params.require(:task).permit(:name, :description, :completion_status, :completion_date)
  end
end
