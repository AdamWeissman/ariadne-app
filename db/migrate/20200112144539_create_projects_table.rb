class CreateProjectsTable < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer "user_id"

      t.string "project_name"
      t.integer "project_version"
      t.text "project_summary"

      t.datetime "created_at"
      t.datetime "updated_at"

      t.text "the_initial_blob_to_parse"
      t.text "the_final_blob_from_the_final_phase"
      t.integer "current_phase"

      t.timestamps null: false
    end
  end
end
