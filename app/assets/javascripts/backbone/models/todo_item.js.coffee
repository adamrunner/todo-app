class TodoApp.Models.TodoItem extends Backbone.Model
  paramRoot: 'todo_item'
  url: () ->
    @base = "/todo"
    if @id is undefined
      return @base
    else
      return "#{@base}/#{@id}"

  defaults:
    title: null
    note: null
    due_date: null

class TodoApp.Collections.TodoItemsCollection extends Backbone.Collection
  model: TodoApp.Models.TodoItem
  url: '/todo'
  comparator: 'due_date'
