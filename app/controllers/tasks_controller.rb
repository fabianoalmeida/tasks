class TasksController < ApplicationController
  layout 'logged'
  
  before_filter :authenticate_user!
  
  load_and_authorize_resource :task

  def index
    @tasks = Task.all
    respond_with(@tasks)
  end

  def show
    @task = Task.find(params[:id])
    respond_with(@task.list, @task)
  end

  def new
    @task = Task.new
    respond_with(@task.list, @task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    @list = List.find(params[:list_id])
    @task.list = @list
    @task.save
    respond_with(@list, @task)
  end

  def update
    @task = Task.find(params[:id])
    @task.update_attributes(params[:task])
    respond_with(@task.list, @task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    respond_with(@task.list, @task)
  end
end
