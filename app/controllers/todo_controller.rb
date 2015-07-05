class TodoController < ApplicationController
  def index
    @todos = TodoItem.all
  end

  def show
    @todo = TodoItem.find(params[:id])
  end

  def new
    @todo = TodoItem.new
  end

  def create
    @todo = TodoItem.create(todo_params)
    # redirect_to root_path, flash: {notice: "Item Created"}
  end

  def delete
    @todo = TodoItem.find(params[:id]).destroy
    redirect_to root_path, flash: {notice: "Item Removed"}
  end

  private

  def todo_params
    params.permit('title', 'note', 'due_date')
  end
end
