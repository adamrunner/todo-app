TodoApp.Views.TodoItems ||= {}

class TodoApp.Views.TodoItems.IndexView extends Backbone.View
  template: JST["backbone/templates/todo_items/index"]
  events:
    "click .destroy" : "destroy"
    "click .actions-display" : "showActions"

  el: '#todo_items'

  initialize: ->
    @listenTo(@collection, 'update', @render)
    @collection.reset()
    @collection.fetch()
    @render()

  render: ->
    @$el.html(@template({collection: @collection.toJSON()}))
    @collection.forEach (item) ->
      item_view = new TodoApp.Views.TodoItems.TodoView({item: item})
      item_view.render()
    @

  destroy: (e) ->
    e.preventDefault()
    element = $(e.originalEvent.target)
    id      = element.data('id')
    model   = @collection.get(id)
    model.destroy(
      success: (model, response, options) ->
        element.remove()
        window.router.navigate('index', {trigger: true})
    )

  showActions: (e) ->
    e.preventDefault()
    li_id = $(e.currentTarget).data('id')
    li_element = $("##{li_id}")
    $(".active").removeClass("active")
    li_element.find(".action-items").addClass("active")
