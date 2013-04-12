class CreateCheckins < ActiveRecord::Migration
  def change
    create_table :checkins do |t|
      t.string :place
      t.integer :user_id
      t.integer :family_id

      t.timestamps
    end
  end
end
