class CreateTasksTable < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer "project_id"
      t.datetime "created_at"
      t.datetime "updated_at"

      t.string "the_action_description"
      t.string "comment_or_measure"

      t.string "segment"

      t.float "base_rank"
      t.float "calculated_rank"
      t.float "user_rank"

      t.string "golem"

      t.timestamps null: false
    end
  end
end
