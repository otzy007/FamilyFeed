class AddLongitudeAndLatitudeColumnsToCheckin < ActiveRecord::Migration
  def change
    add_column :checkins, :longitude, :float
    add_column :checkins, :latitude, :float
  end
end
