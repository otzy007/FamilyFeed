class AddFamilyToUser < ActiveRecord::Migration
  def change
    add_column :users, :family, :integer
  end
end
