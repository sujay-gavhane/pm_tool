class Todo < ApplicationRecord
  belongs_to :project

  validates :title, presence: true, uniqueness: true
  validates :project_id, presence: true
end
