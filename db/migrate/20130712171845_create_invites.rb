class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.string :email
      t.string :token
      t.integer :family_id
      t.integer :user_id

      t.timestamps
    end
  end
end
