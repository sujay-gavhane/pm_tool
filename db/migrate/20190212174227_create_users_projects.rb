class CreateUsersProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :users_projects do |t|
    	t.integer :project_id
    	t.integer :user_id

    	t.timestamps
    end
  end
end
