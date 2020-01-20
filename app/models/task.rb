class Task < ActiveRecord::Base
  belongs_to :project
  has_one :task_score

end
