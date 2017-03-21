# app/controllers/tasks_controller.rb

class TasksController < ApplicationController

  def index
    @tasks = Task.order(:completion_date)  # program implicitly knows order means for all records
  end

  def new
    @post = Task.new
  end

  def create
    @post = Task.new params[:task]
    if @post.save
      redirect_to posts_path
    else
      render :action => 'new'
    end
  end

  def edit
    @post = Task.find params[:id]
  end

  def update
    @post = Task.find params[:id]
    if @post.update_attributes params[:task]
      redirect_to posts_path
    else
      render :action => :edit
    end
  end

  def destroy
    @post = Task.find params[:id]
    @post.destroy
    redirect_to posts_path
  end

  def show
    @post = Task.find params[:id]
  end

end
