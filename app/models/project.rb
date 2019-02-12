class Project < ApplicationRecord
	has_many :users, through: :users_projects
end
