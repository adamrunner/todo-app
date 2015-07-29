TodoApp.Views.TodoItems ||= {}

class TodoApp.Views.TodoItems.EditView extends Backbone.View
  template: JST["backbone/templates/todo_items/edit"]
  el: '#todo_items'
  events:
    'submit #new-todo' : 'save'
  initialize: ->
    @model = new TodoApp.Models.TodoItem({id: @id})
    @model.fetch()
    @listenTo(@model, 'change', @render)

  render: ->
    console.log('edit view render called')
    @$el.html @template(@model.toJSON())
    @

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()
    title = $('#title').val()
    note = $('#note').val()
    due_date = $('#due_date').val()
    @model.save({title: title, note: note, due_date: due_date},
      success: (todo) ->
        @model = todo
        window.location.hash = "/#{@model.id}")
