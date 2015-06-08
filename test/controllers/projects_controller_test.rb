require "test_helper"

describe ProjectsController do

  let(:project) { projects :one }

  it "gets index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:projects)
  end

  it "gets new" do
    get :new
    assert_response :success
  end

  it "creates project" do
    assert_difference('Project.count') do
      post :create, project: { company_id: project.company_id, description: project.description, name: project.name, status_id: project.status_id }
    end

    assert_redirected_to project_path(assigns(:project))
  end

  it "shows project" do
    get :show, id: project
    assert_response :success
  end

  it "gets edit" do
    get :edit, id: project
    assert_response :success
  end

  it "updates project" do
    put :update, id: project, project: { company_id: project.company_id, description: project.description, name: project.name, status_id: project.status_id }
    assert_redirected_to project_path(assigns(:project))
  end

  it "destroys project" do
    assert_difference('Project.count', -1) do
      delete :destroy, id: project
    end

    assert_redirected_to projects_path
  end

end
