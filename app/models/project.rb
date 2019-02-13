class Project < ApplicationRecord
	has_many :users, through: :users_projects
	has_many :todos, dependent: :destroy

	validates :title, presence: true, uniqueness: true
end
