class TodoApp.Models.TodoItem extends Backbone.Model
  paramRoot: 'todo_item'

  defaults:
    title: null
    note: null
    due_date: null

class TodoApp.Collections.TodoItemsCollection extends Backbone.Collection
  model: TodoApp.Models.TodoItem
  url: '/todo'
