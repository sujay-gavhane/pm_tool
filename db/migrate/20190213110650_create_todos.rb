class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
    	t.string :title
    	t.text :description
    	t.integer :project_id, nil: false
    	t.integer :status, nil: false, default: 0

    	t.timestamps
    end
  end
end
