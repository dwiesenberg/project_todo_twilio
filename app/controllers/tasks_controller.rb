# app/controllers/tasks_controller.rb

class TasksController < ApplicationController

  def index
    @tasks = Task.order(:completion_date)  # program implicitly knows order means for all records
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new params[:task]
    if @task.save
      redirect_to tasks_path
    else
      render :action => 'new'
    end
  end

  def edit
    @task = Task.find params[:id]
  end

  def update
    @task = Task.find params[:id]
    if @task.update_attributes params[:task]
      redirect_to tasks_path
    else
      render :action => :edit
    end
  end

  def destroy
    @task = Task.find params[:id]
    @task.destroy
    redirect_to tasks_path
  end

  def show
    @task = Task.find params[:id]
  end

end
