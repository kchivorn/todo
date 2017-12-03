class AddSlugToTodoList < ActiveRecord::Migration[5.1]
  def change
    add_column :todo_lists, :slug, :string
    add_index :todo_lists, :slug, unique: true
  end
end
