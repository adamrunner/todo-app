class TodoApp.Views.TodoItems.TodoView extends Backbone.View
  template: JST["backbone/templates/todo_items/todo"]
  el: '.todo-list'
  initialize: (options) ->
    @item = options.item
  render: () ->
    @$el.append(@template(@item.attributes))
    @
  outputTemplate: () ->
    @template(@item.attributes)
