json.todo_item do
  json.title @todo.title
  json.note @todo.note
  json.due_date @todo.due_date
end
