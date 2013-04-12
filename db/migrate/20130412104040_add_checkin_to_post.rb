class AddCheckinToPost < ActiveRecord::Migration
  def change
    add_column :posts, :checkin_id, :integer
  end
end
