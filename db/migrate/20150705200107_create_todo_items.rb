class CreateTodoItems < ActiveRecord::Migration
  def change
    create_table :todo_items do |t|
      t.datetime :due_date
      t.text :title
      t.text :note
      t.boolean :completed

      t.timestamps
    end
  end
end
