class TodoApp.Routers.TodoItemsRouter extends Backbone.Router
  initialize: (options) ->
    @todos = new TodoApp.Collections.TodoItemsCollection()
    @todos.reset options.todos
  routes:
    "index"    : "index"
    "new"      : "newPost"
    ":id"      : "show"
    ":id/edit" : "edit"
    ".*"       : "index"

  index: ->
    @view = new TodoApp.Views.TodoItems.IndexView({collection: @todos})
  newPost: ->
    @view = new TodoApp.Views.TodoItems.NewView({collection: @todos})

  show: (id) ->
    @todos.fetch()
    @view = new TodoApp.Views.TodoItems.ShowView({collection: @todos, id: id})

  edit: (id) ->
    @view = new TodoApp.Views.TodoItems.EditView({id: id})
