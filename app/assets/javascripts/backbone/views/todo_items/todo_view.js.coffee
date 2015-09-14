class TodoApp.Views.TodoItems.TodoView extends Backbone.View
  template: JST["backbone/templates/todo_items/todo"]

  tagName: 'li'
  className: 'list-group-item actionable'

  initialize: (options) ->
    @$el.attr('id', "todo_item_#{@model.id}")
    @li_id = "#todo_item_#{@model.id}"
    events = {
      "click .destroy" : "destroy"
      "click .actions-display" : "showActions"
    }
    @delegateEvents(events)
    @render()

  render: () ->
    @$el.html(@template(@model.attributes))
    @

  outputTemplate: () ->
    @template(@model.attributes)

  showActions: (e) ->
    e.preventDefault()
    $(".active").removeClass("active")
    @$(".action-items").addClass("active")

  handleRemove: () =>
    @remove()

  destroy: (e) ->
    e.preventDefault()
    @model.destroy(
      success: (model, response, options) =>
        @$el.velocity('transition.bounceOut', {complete: @handleRemove})
    )
