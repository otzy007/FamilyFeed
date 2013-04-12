class AddPostToCheckin < ActiveRecord::Migration
  def change
    add_column :checkins, :post_id, :integer
  end
end
