class Project < ApplicationRecord
	has_many :assigned_projects
	has_many :users, through: :assigned_projects
	has_many :todos, dependent: :destroy

	validates :title, presence: true, uniqueness: true
end
