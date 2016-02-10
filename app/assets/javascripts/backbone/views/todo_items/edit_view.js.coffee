TodoApp.Views.TodoItems ||= {}

class TodoApp.Views.TodoItems.EditView extends Backbone.View
  template: JST["backbone/templates/todo_items/edit"]
  events:
    'submit #edit-todo' : 'save'
  initialize: ->
    @setElement("#todo_item_#{@id}")
    @model = @collection.get(@id)
    @render()

  render: ->
    @$el.html @template(@model.attributes)
    @

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()
    title    = $('#title').val()
    note     = $('#note').val()
    due_date = $('#due_date').val()
    @model.save({title: title, note: note, due_date: due_date},
      success: (todo) =>
        @remove()
        window.router.navigate("index", {trigger:true})
    )
