class AddGmapsColumnToCheckin < ActiveRecord::Migration
  def change
    add_column :checkins, :gmaps, :boolean
  end
end
