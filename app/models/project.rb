class Project < ActiveRecord::Base
  belongs_to :user
  has_many :tasks, :dependent => :destroy
  has_many :task_scores, :through => :tasks
  has_many :ariadne_messages
end
