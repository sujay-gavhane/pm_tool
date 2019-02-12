class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_project, only: [:edit, :update]
  def index
    @projects = Project.all.order('created_at desc')
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to projects_path, notice: 'Project created successfully'
    else
      flash[:alert] =  "#{@project.errors.full_messages.join('<br>')}"
      render action: :new
    end
  end

  def update
    if @project.update_attributes(project_params)
      redirect_to projects_path, notice: 'Project updated successfully'
    else
      flash[:alert] =  "#{@project.errors.full_messages.join('<br>')}"
      render action: :edit
    end
  end

  private

  def find_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description)
  end
end
