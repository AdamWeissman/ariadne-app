class CreateAriadneMessagesTable < ActiveRecord::Migration
  def change
    create_table :ariadne_messages do |t|
      t.integer "user_id"
      t.integer "project_id"
      t.integer "phase_number"

      t.string "message_or_quote"
      t.string "author"

      t.timestamps null: false
    end
  end
end
