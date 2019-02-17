require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase

  def setup
    FactoryBot.reload
    @user = create(:user)
    @developer = create(:user)
    sign_in(@user)
    @user.add_role(:manager)
    @project = create(:project)
  end

  test '#index should get all projects' do
    get :index
    assert_response :success
  end

  test '#index should redirect to all projects path' do
    get :index
    assert_match "Project", @response.body
  end

  test '#index should create new instance of project' do
    get :new
    assert_response :success
  end

  test '#index should create new project' do
    post :create,
    params: { project: { title: "test title", body: "test description" }}
    assert_response 302
    assert_redirected_to projects_path
  end

  test '#index should return success message project' do
    post :create,
    params: { project: { title: "test title", body: "test description" }}
    assert_match 'Project created successfully', flash[:notice]
  end

  test 'should increase count' do
    assert_difference 'Project.count' do
      post :create, params: { project: { title: "test title", body: "test description" }}
    end
  end

  test 'should update project title' do
    patch :update, id: @project,
     params: { project: { title: 'asdfasd', description: 'asdfaids' }}
    assert_match 'Project updated successfully', flash[:notice]
  end

end
