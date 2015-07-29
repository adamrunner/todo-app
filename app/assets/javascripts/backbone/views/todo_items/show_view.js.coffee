TodoApp.Views.TodoItems ||= {}

class TodoApp.Views.TodoItems.ShowView extends Backbone.View
  template: JST["backbone/templates/todo_items/show"]
  el: '#todo_items'
  initialize: ->
    @model = @collection.get(@id)
    if @model is undefined
      @model = new TodoApp.Models.TodoItem({id: @id})
    @model.fetch()
    @listenTo(@model, 'change', @render)
  render: ->
    @$el.html(@template(@model.toJSON()))
    @
