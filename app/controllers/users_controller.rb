class UsersController < ApplicationController
  before_action :authenticate_user!

  def fetch_developers
    developers = if params[:project_id].present?
      Project.find(params[:project_id]).users
    else
      User.with_role(:developer)
    end
    render json: developers.select([:id, :first_name, :last_name])
  end
end
