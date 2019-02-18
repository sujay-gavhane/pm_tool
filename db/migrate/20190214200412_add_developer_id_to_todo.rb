class AddDeveloperIdToTodo < ActiveRecord::Migration[5.2]
  def change
  	add_column :todos, :developer_id, :integer
  end
end
