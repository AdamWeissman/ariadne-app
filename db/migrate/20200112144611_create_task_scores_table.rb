class CreateTaskScoresTable < ActiveRecord::Migration
  def change
    create_table :task_scores do |t|
      t.integer "task_id"
      t.string "necessary_or_optional_for_form_rendering"
      t.float "necessary_or_optional_score"
      t.string "quick_or_slow_for_form_rendering"
      t.float "quick_or_slow_score"
      t.string "easy_or_hard_for_form_rendering"
      t.float "easy_or_hard_score"
  end
end
