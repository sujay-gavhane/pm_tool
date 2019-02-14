class AssignedProject < ApplicationRecord
  belongs_to :project
  belongs_to :user

  def self.create_assigned_projects(project_id, developer_ids)
    developer_ids.each do |id|
      AssignedProject.create(project_id: project_id, user_id: id)
    end
  end
end
