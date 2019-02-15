class Todo < ApplicationRecord
  belongs_to :project
  belongs_to :user, foreign_key: 'developer_id'

  validates :title, presence: true, uniqueness: true
  validates :project_id, presence: true
end
