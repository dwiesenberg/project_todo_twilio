# app/controllers/tasks_controller.rb

class TasksController < ApplicationController

  def index
    @tasks = Task.order(:completion_date)  # program implicitly knows order means for all records
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:notice] = "Task '#{@task.name}' Created!"
      redirect_to tasks_path
    else
      flash[:notice] = "Creation Failed --- '#{@task.name}' Not Added! #{@task.errors.full_messages}"
      render :action => 'new'
    end
  end

  def edit
    @task = Task.find params[:id]
  end

  def update
    @task = Task.find params[:id]
    if @task.update(task_params)
      flash[:notice] = "Task '#{@task.name}' Modified!"
      redirect_to tasks_path
    else
      flash[:notice] = "Edit Failed -- '#{@task.name}' Not Modified!}"
      render :action => :edit
    end
  end

 def destroy
    @task = Task.find params[:id]
    if @task.destroy
      flash[:notice] = "Task '#{@task.name}' Deleted (Reversible)!"
    else
      flash[:notice] = "Deletion Failed --- '#{@task.name}' Not Removed!}"
    end
    redirect_to tasks_path
  end

 #  def soft_delete
 #    @task = Task.find params[:id]
 #    if @task.destroy
 #      flash[:notice] = "Task '#{@task.name}' Deleted (Reversible)!"
 #      render :action => :edit_
 #    else
 #      flash[:notice] = "Deletion Failed --- '#{@task.name}' Not Removed!}"
 #    end
 #    redirect_to tasks_path
 #  end

 # def hard_delete
 #    @task = Task.find params[:id]
 #    if @task.destroy
 #      flash[:notice] = "Task '#{@task.name}' Deleted (Irreversible)!"
 #    else
 #      flash[:notice] = "Deletion Failed --- '#{@task.name}' Not Removed!}"
 #    end
 #    redirect_to tasks_path
 #  end

  def show
    @task = Task.find params[:id]
  end


  private

  def task_params
    params.require(:task).permit(:name, :description, :man_hours, :resources, :completion_date, :deleted)
  end


end
