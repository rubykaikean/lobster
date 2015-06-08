require "test_helper"

describe PhasesController do

  let(:phase) { phases :one }

  it "gets index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:phases)
  end

  it "gets new" do
    get :new
    assert_response :success
  end

  it "creates phase" do
    assert_difference('Phase.count') do
      post :create, phase: { description: phase.description, name: phase.name, project_id: phase.project_id, status_id: phase.status_id }
    end

    assert_redirected_to phase_path(assigns(:phase))
  end

  it "shows phase" do
    get :show, id: phase
    assert_response :success
  end

  it "gets edit" do
    get :edit, id: phase
    assert_response :success
  end

  it "updates phase" do
    put :update, id: phase, phase: { description: phase.description, name: phase.name, project_id: phase.project_id, status_id: phase.status_id }
    assert_redirected_to phase_path(assigns(:phase))
  end

  it "destroys phase" do
    assert_difference('Phase.count', -1) do
      delete :destroy, id: phase
    end

    assert_redirected_to phases_path
  end

end
