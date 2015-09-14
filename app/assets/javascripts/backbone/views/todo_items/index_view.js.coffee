TodoApp.Views.TodoItems ||= {}

class TodoApp.Views.TodoItems.IndexView extends Backbone.View
  template: JST["backbone/templates/todo_items/index"]

  el: '#todo_items'

  initialize: ->
    @listenTo(@collection, 'update', @render)
    @render()

  render: ->
    @$el.html(@template({collection: @collection}))
    @collection.forEach (item) ->
      item_view = new TodoApp.Views.TodoItems.TodoView({model: item})
      item_view.render()
    @
