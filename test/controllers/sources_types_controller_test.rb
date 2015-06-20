require "test_helper"

describe SourcesTypesController do

  let(:sources_type) { sources_types :one }

  it "gets index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sources_types)
  end

  it "gets new" do
    get :new
    assert_response :success
  end

  it "creates sources_type" do
    assert_difference('SourcesType.count') do
      post :create, sources_type: { name: sources_type.name }
    end

    assert_redirected_to sources_type_path(assigns(:sources_type))
  end

  it "shows sources_type" do
    get :show, id: sources_type
    assert_response :success
  end

  it "gets edit" do
    get :edit, id: sources_type
    assert_response :success
  end

  it "updates sources_type" do
    put :update, id: sources_type, sources_type: { name: sources_type.name }
    assert_redirected_to sources_type_path(assigns(:sources_type))
  end

  it "destroys sources_type" do
    assert_difference('SourcesType.count', -1) do
      delete :destroy, id: sources_type
    end

    assert_redirected_to sources_types_path
  end

end
