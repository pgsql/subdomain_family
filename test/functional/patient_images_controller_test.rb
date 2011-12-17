require 'test_helper'

class PatientImagesControllerTest < ActionController::TestCase
  setup do
    @patient_image = patient_images(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:patient_images)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create patient_image" do
    assert_difference('PatientImage.count') do
      post :create, :patient_image => @patient_image.attributes
    end

    assert_redirected_to patient_image_path(assigns(:patient_image))
  end

  test "should show patient_image" do
    get :show, :id => @patient_image.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @patient_image.to_param
    assert_response :success
  end

  test "should update patient_image" do
    put :update, :id => @patient_image.to_param, :patient_image => @patient_image.attributes
    assert_redirected_to patient_image_path(assigns(:patient_image))
  end

  test "should destroy patient_image" do
    assert_difference('PatientImage.count', -1) do
      delete :destroy, :id => @patient_image.to_param
    end

    assert_redirected_to patient_images_path
  end
end
