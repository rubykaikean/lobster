require "test_helper"

describe ProductPhotosController do

  let(:product_photo) { product_photos :one }

  it "gets index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_photos)
  end

  it "gets new" do
    get :new
    assert_response :success
  end

  it "creates product_photo" do
    assert_difference('ProductPhoto.count') do
      post :create, product_photo: {  }
    end

    assert_redirected_to product_photo_path(assigns(:product_photo))
  end

  it "shows product_photo" do
    get :show, id: product_photo
    assert_response :success
  end

  it "gets edit" do
    get :edit, id: product_photo
    assert_response :success
  end

  it "updates product_photo" do
    put :update, id: product_photo, product_photo: {  }
    assert_redirected_to product_photo_path(assigns(:product_photo))
  end

  it "destroys product_photo" do
    assert_difference('ProductPhoto.count', -1) do
      delete :destroy, id: product_photo
    end

    assert_redirected_to product_photos_path
  end

end
