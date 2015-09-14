class TodoApp.Views.TodoItems.TodoView extends Backbone.View
  template: JST["backbone/templates/todo_items/todo"]

  el: '.todo-list'
  initialize: (options) ->
    @li_id = "#todo_item_#{@model.id}"
    events = {
      "click #{@li_id} .destroy" : "destroy"
      "click #{@li_id} .actions-display" : "showActions"
    }
    @delegateEvents(events)

  render: () ->
    @$el.append(@template(@model.attributes))
    @

  outputTemplate: () ->
    @template(@model.attributes)

  showActions: (e) ->
    e.preventDefault()
    $(".active").removeClass("active")
    li_element = $("#{@li_id}")
    li_element.find(".action-items").addClass("active")

  destroy: (e) ->
    @model.destroy(
      success: (model, response, options) =>
        @remove()
        window.router.navigate('index', {trigger: true})
    )
