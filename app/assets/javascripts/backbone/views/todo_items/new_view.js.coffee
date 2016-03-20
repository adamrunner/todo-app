class TodoApp.Views.TodoItems.NewView extends Backbone.View
  template: JST["backbone/templates/todo_items/new"]
  el: '#todo-list'
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
    newModel = new TodoApp.Models.TodoItem({title: title, note: note, due_date: due_date})
    @collection.add newModel
    newModel.save({
      wait: true,
      success: (todo) ->
        window.router.navigate('index', {trigger: true})
      })
