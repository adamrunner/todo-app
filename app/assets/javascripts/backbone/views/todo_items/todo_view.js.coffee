class TodoApp.Views.TodoItems.TodoView extends Backbone.View
  template: JST["backbone/templates/todo_items/todo"]

  tagName: 'li'
  className: 'list-group-item actionable'
  events:
    "click .destroy" : "destroy"
    "click .actions-display" : "showActions"

  initialize: (options) ->
    @$el.attr('id', "todo_item_#{@model.id}")
    @render()

  render: () ->
    @$el.html(@template(@model.attributes))
    @

  outputTemplate: () ->
    @template(@model.attributes)

  showActions: (e) ->
    e.preventDefault()
    $(".selected.action-items").removeClass('selected').velocity('transition.slideUpOut',{duration: 200})
    @$('.action-items').addClass("selected").velocity('transition.slideDownIn', {duration: 200})

  handleRemove: () =>
    @remove()

  destroy: (e) ->
    e.preventDefault()
    @model.destroy(
      success: (model, response, options) =>
        @$el.velocity('transition.slideUpOut', {complete: @handleRemove, duration: 250})
    )
