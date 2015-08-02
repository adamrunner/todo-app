class TodoApp.Views.TodoItems.NewView extends Backbone.View
  template: JST["backbone/templates/todo_items/new"]
  el: '#todo_items'
  events:
    'submit #new-todo' : 'save'
  initialize: ->
    @render()

  render: ->
    @$el.prepend @template
    @
  save: (e) ->
    e.preventDefault()
    e.stopPropagation()
    title    = $('#title').val()
    note     = $('#note').val()
    due_date = $('#due_date').val()
    @collection.create {title: title, note: note, due_date: due_date},
      wait: true,
      success: (todo) ->
        window.router.navigate("index", {trigger:true})
