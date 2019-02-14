class AssignedProject < ApplicationRecord
  belongs_to :project
  belongs_to :user

  validates_uniqueness_of :user_id, scope: :project_id

  def self.create_assigned_projects(project_id, developer_ids)
  	AssignedProject.where('project_id = ? AND user_id NOT IN (?)', project_id, developer_ids).destroy_all
    developer_ids.each do |id|
      AssignedProject.create(project_id: project_id, user_id: id)
    end
  end
end
