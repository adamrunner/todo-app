class TodoController < ApplicationController
  def index
    @todos = TodoItem.order(:due_date).all
  end

  def show
    @todo = TodoItem.find(params[:id])
  end

  def new
    @todo = TodoItem.new
  end

  def edit
    @todo = TodoItem.find(params[:id])
  end

  def update
    @todo = TodoItem.find(todo_params[:id])
    @todo.title    = todo_params[:title]
    @todo.note     = todo_params[:note]
    @todo.due_date = todo_params[:due_date]
    binding.pry
    @todo.save

  end

  def create
    @todo = TodoItem.create(todo_params)
    # redirect_to root_path, flash: {notice: "Item Created"}
  end

  def destroy
    @todo = TodoItem.find(params[:id]).destroy
  end

  private

  def todo_params
    params.require('todo_item').permit('id', 'title', 'note', 'due_date')
  end
end
