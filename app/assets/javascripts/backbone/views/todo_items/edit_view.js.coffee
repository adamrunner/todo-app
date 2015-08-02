TodoApp.Views.TodoItems ||= {}

class TodoApp.Views.TodoItems.EditView extends Backbone.View
  template: JST["backbone/templates/todo_items/edit"]
  el: '#todo_items'
  events:
    'submit #new-todo' : 'save'
  initialize: ->
    @$element = $("#todo_item_#{@id}")
    @model    = new TodoApp.Models.TodoItem({id: @id})
    @model.fetch({
      success: => @render()
    })

  render: ->
    @$element.html @template(@model.toJSON())
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
        $('#app_container').append("<div id='todo_items'></div>")
        window.router.navigate("index", {trigger:true})
        )
