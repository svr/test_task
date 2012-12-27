class Task < ActiveRecord::Base
  attr_accessible :deadline_at, :name, :priority, :project_id, :status
  belongs_to :project
end
