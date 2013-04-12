class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :type
      t.text :text
      t.integer :user_id
      t.integer :post_id
      t.string :status

      t.timestamps
    end
  end
end
