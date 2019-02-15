class TodosController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user
  before_action :find_todo, only: [:edit, :update, :destroy]
  before_action :find_project, only: [:new, :index, :edit, :update, :create]

  def index
    @todos = @project.todos.order('created_at desc')
  end

  def new
    @todo = @project.todos.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      redirect_to project_todos_path, notice: 'Todo created successfully'
    else
      flash[:alert] = @todo.errors.full_messages.join('<br>').to_s
      render action: :new
    end
  end

  def edit
    gon.selected_developer = [@todo.developer_id]
  end

  def update
    if @todo.update_attributes(todo_params)
      redirect_to project_todos_path, notice: 'Todo updated successfully'
    else
      flash[:alert] = @todo.errors.full_messages.join('<br>').to_s
      render action: :edit
    end
  end

  def destroy
    if @todo.destroy
      redirect_to project_todos_path, notice: 'Todo destroyed successfully'
    else
      redirect_to project_todos_path,
                  alert: @todo.errors.full_messages.join('<br>').to_s
    end
  end

  def status_by_developers
    @todos = Todo.includes(:user).all.group_by(&:developer_id)
  end

  def status_by_project
    @todos = Todo.includes(:user).all.group_by(&:project_id)
  end

  private

  def find_todo
    @todo = Todo.find(params[:id])
  end

  def find_project
    @project = Project.find(params[:project_id])
  end

  def todo_params
    params.require(:todo).permit(:title, :description, :project_id, :status,
                                 :developer_id)
  end

  def authorize_user
    authorize! :manage, :all
  end
end
