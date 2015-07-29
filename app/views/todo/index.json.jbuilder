json.array! @todos do |todo|
  json.id todo.id
  json.title todo.title
  json.note todo.note
  json.due_date datetime_index_value(todo.due_date)
end
