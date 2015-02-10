require 'test_helper'

class MemberhsipsControllerTest < ActionController::TestCase
  setup do
    @memberhsip = memberhsips(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:memberhsips)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create memberhsip" do
    assert_difference('Memberhsip.count') do
      post :create, memberhsip: { status: @memberhsip.status }
    end

    assert_redirected_to memberhsip_path(assigns(:memberhsip))
  end

  test "should show memberhsip" do
    get :show, id: @memberhsip
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @memberhsip
    assert_response :success
  end

  test "should update memberhsip" do
    patch :update, id: @memberhsip, memberhsip: { status: @memberhsip.status }
    assert_redirected_to memberhsip_path(assigns(:memberhsip))
  end

  test "should destroy memberhsip" do
    assert_difference('Memberhsip.count', -1) do
      delete :destroy, id: @memberhsip
    end

    assert_redirected_to memberhsips_path
  end
end
