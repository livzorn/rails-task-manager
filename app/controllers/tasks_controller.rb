class TasksController < ApplicationController
  def index
    @tasks = Task.all
    if params[:completed] == true
      @completed = '☑'
    else
      @completed = '☐'
    end
  end

  def show
    @task = Task.find(params[:id])
    if params[:completed] == true
      @completed = '☑ This task has been completed.'
    else
      @completed = '☐ This task has not yet been completed.'
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
    redirect_to tasks_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])
    task.update(task_params)
    redirect_to task_path(task.id)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end
end
