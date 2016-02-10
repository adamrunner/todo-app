TodoApp.Views.TodoItems ||= {}

class TodoApp.Views.TodoItems.ShowView extends Backbone.View
  template: JST["backbone/templates/todo_items/show"]
  initialize: ->
    @setElement("#todo_item_#{@id}")
    @model = @collection.get(@id)
    @listenTo(@model, 'change', @render)
    @render()
  render: ->
    @$el.html(@template(@model.attributes))
    @
