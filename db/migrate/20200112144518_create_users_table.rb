class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string "username"
      t.string "password_digest"
      t.string "email"
      t.string "first_name"
      t.datetime "created_at"
  end
end
