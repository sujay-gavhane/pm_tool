require 'test_helper'

class TodosControllerTest < ActionController::TestCase

  def setup
    FactoryBot.reload
    @user = create(:user)
    @developer = create(:user)
    sign_in(@user)
    @user.add_role(:manager)
    @developer.add_role(:developer)
    @project = create(:project)
    create(:assigned_project, user_id: @developer.id, project_id: @project.id)
    @todo = create(:todo, project_id: @project.id, developer_id: @developer.id)
    @todo1 = create(:todo, project_id: @project.id, developer_id: @developer.id)

  end

  test 'index should return success' do
    get :index, params: { project_id: @project.id }
    assert_response :success
  end

  test 'index should return objects of type Todo' do
    get :index, params: { project_id: @project.id }
    assert_match "Todo", @response.body
  end

  test 'should create new instance of project and return success' do
    get :new, params: { project_id: @project.id }
    assert_response :success
  end

  test '#index should create new project' do
    assert_difference 'Todo.count' do
      post :create,
      params: { project_id: @project.id, todo: { title: "test title",
                description: "test description", project_id: @project.id,
                developer_id: @developer.id }}
    end
    assert_response 302
    assert_match 'Todo created successfully', flash[:notice]
  end

  test 'should update todo title' do
    patch :update,
      params: { id: @todo, project_id: @project.id, todo: { title: "lkajsdflkasjd",
                description: "akjsdfh kajshd", project_id: @project.id,
                developer_id: @developer.id }}
    assert_match 'Todo updated successfully', flash[:notice]
  end

  test 'should destroy todo' do
    assert_difference 'Todo.count', -1 do
      delete :destroy,
        params: { id: @todo.id, project_id: @project.id }
    end
    assert_match 'Todo destroyed successfully', flash[:notice]
  end

  test 'should list todo status by developers' do
    get :status_by_developers,
      params: { id: @todo.id, project_id: @project.id }
    assert_equal 1, assigns(:todos).count
  end

  test 'should list todo status by project' do
    get :status_by_project,
      params: { id: @todo.id, project_id: @project.id }
    assert_equal 1, assigns(:todos).count
  end

  test 'should list developer todos by project' do
    sign_in(@developer)
    get :developer_todo_list, params: { project_id: @project.id}
    assert_equal 1, assigns(:projects).count
    assert_equal 2, assigns(:todos).count
  end

  test 'should list chart view of todos' do
    get :chart_view, params: { project_id: @project.id}
    assert_equal 1, assigns(:projects).count
    assert_equal 2, assigns(:todos).count
  end

  test 'should update todo status' do
    patch :update_status,
      params: { id: @todo, project_id: @project.id, status: 'in_progress', todo: { title: "lkajsdflkasjd",
                description: "akjsdfh kajshd", project_id: @project.id,
                developer_id: @developer.id }}, xhr: true
    assert_match 'Status Updated successfully', flash[:notice]
  end


  # test '#index should return success message project' do
  #   post :create,
  #   params: { project: { title: "test title", body: "test description" }}
  #   assert_match 'Project created successfully', flash[:notice]
  # end

  # test 'should increase count' do
  #   assert_difference 'Project.count' do
  #     post :create, params: { project: { title: "test title", body: "test description" }}
  #   end
  # end

  # test 'should update project title' do
  #   put :update,
  #    params: { id: @project.id, project: { title: 'asdfasd', description: 'asdfaids', developer_ids: [@developer.id] }}
  #   assert_match 'Project updated successfully', flash[:notice]
  # end

end
