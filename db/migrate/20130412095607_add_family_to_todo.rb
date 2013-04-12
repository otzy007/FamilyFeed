class AddFamilyToTodo < ActiveRecord::Migration
  def change
    add_column :todos, :family_id, :integer
  end
end
