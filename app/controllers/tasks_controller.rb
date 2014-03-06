class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end


  def new
    @task = Task.new
    @attachment = Attachment.new
  end

  def create
    @task = Task.new(task_parameters)
    if @task.save
      @tasks = Task.all
      render "index"
    else
      render "new"
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to root_path
  end

  private
  def task_parameters
    params.require(:task).permit(:title, :description)
  end

end
