class TasksController < ApplicationController

  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.create(tasks_params)
    redirect_to list_path(@list.id)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to list_path(params[:list_id])
  end

  def toggle
    @task = Task.find(params[:id])
    @task.done = !@task.done
    @task.save
    redirect_to list_path(params[:list_id])
  end

  def search
    @tasks = Task.search(params[:search])
  end

  private
    def tasks_params
      params[:task].permit(:title, :deadline)
    end

end
