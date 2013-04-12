class CreateCalendars < ActiveRecord::Migration
  def change
    create_table :calendars do |t|
      t.datetime :date
      t.text :text
      t.integer :user_id
      t.integer :post_id

      t.timestamps
    end
  end
end
