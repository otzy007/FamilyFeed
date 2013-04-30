class RemoveTypeColumnFromTodo < ActiveRecord::Migration
  def change
     remove_column :todos, :type
  end
end
