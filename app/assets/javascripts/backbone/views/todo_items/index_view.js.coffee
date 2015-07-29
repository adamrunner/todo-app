TodoApp.Views.TodoItems ||= {}

class TodoApp.Views.TodoItems.IndexView extends Backbone.View
  template: JST["backbone/templates/todo_items/index"]
  events:
    "click .destroy" : "destroy"

  el: '#todo_items'

  initialize: ->
    @listenTo(@collection, 'update', @render)
    @collection.reset()
    @collection.fetch()
    @render

  render: ->
    @$el.html(@template({collection: @collection.toJSON()}))
    @

  destroy: (e) ->
    e.preventDefault()
    element = $(e.originalEvent.target)
    id      = element.data('id')
    model   = @collection.get(id)
    model.destroy(
      success: (model, response, options) ->
        element.remove()
    )
