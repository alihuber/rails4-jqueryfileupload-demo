class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end


  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_parameters)
    attachment_ids = params[:attachments].split(",")
    @task.attachments << Attachment.find(attachment_ids)
    if @task.save
      @tasks = Task.all
      render "index"
    else
      render "new"
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
    respond_to do |format|
      format.html
      format.json {
        render :json => @task.attachments.collect { |a| a.to_jq_upload }.to_json
      }
    end
  end

  def update
    @task = Task.find(params[:id])
    attachment_ids = params[:attachments].split(",")
    @task.attachments = Attachment.find(attachment_ids)
    if @task.update(task_parameters)
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
