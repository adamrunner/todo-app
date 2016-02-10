class TodoApp.Routers.TodoItemsRouter extends Backbone.Router
  initialize: (options) ->
    @todos = new TodoApp.Collections.TodoItemsCollection(options.todo_items)
  routes:
    "index"    : "index"
    "new"      : "newPost"
    ":id"      : "show"
    ":id/edit" : "edit"
    ".*"       : "index"

  index: ->
    @view = new TodoApp.Views.TodoItems.IndexView({collection: @todos})
  newPost: ->
    @indexView = new TodoApp.Views.TodoItems.IndexView({collection: @todos})
    @view = new TodoApp.Views.TodoItems.NewView({collection: @todos})

  show: (id) ->
    @view = new TodoApp.Views.TodoItems.ShowView({collection: @todos, id: id})

  edit: (id) ->
    @view = new TodoApp.Views.TodoItems.EditView({collection: @todos, id: id})
