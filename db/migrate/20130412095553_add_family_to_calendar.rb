class AddFamilyToCalendar < ActiveRecord::Migration
  def change
    add_column :calendars, :family_id, :integer
  end
end
