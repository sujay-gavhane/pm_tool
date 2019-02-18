require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase

  def setup
    FactoryBot.reload
    @user = create(:user)
    @developer = create(:user)
    sign_in(@user)
    @user.add_role(:manager)
    @developer.add_role(:developer)
    @project = create(:project)
  end

  test 'index should return success' do
    get :index
    assert_response :success
  end

  test 'index should return objects of type Project' do
    get :index
    assert_match "Project", @response.body
  end

  test 'should create new instance of project and return success' do
    get :new
    assert_response :success
  end

  test 'should create new project' do
    post :create,
    params: { project: { title: "test title", description: "test description" }}
    assert_response 302
    assert_redirected_to projects_path
  end

  test 'should return success message project' do
    post :create,
    params: { project: { title: "test title", description: "test description" }}
    assert_match 'Project created successfully', flash[:notice]
  end

  test 'should increase count' do
    assert_difference 'Project.count' do
      post :create, params: { project: { title: "test title", description: "test description" }}
    end
  end

  test 'should update project title' do
    put :update,
     params: { id: @project.id, project: { title: 'asdfasd', description: 'asdfaids', developer_ids: [@developer.id] }}
    assert_match 'Project updated successfully', flash[:notice]
  end

end
