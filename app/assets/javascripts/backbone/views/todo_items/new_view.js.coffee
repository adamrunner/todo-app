class TodoApp.Views.TodoItems.NewView extends Backbone.View
  template: JST["backbone/templates/todo_items/new"]
  el: '#todo_items'
  events:
    'submit #new-todo' : 'save'
  initialize: ->
    @render()

  render: ->
    @$el.html @template
    @
  save: (e) ->
    e.preventDefault()
    e.stopPropagation()
    title    = $('#title').val()
    note     = $('#note').val()
    due_date = $('#due_date').val()
    model    = new TodoApp.Models.TodoItem({title: title, note: note, due_date: due_date})
    @collection.create model,
      success: (todo) ->
        @model = todo
        window.location.hash = "/#{@model.id}"
