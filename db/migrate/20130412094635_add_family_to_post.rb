class AddFamilyToPost < ActiveRecord::Migration
  def change
    add_column :posts, :family_id, :integer
  end
end
