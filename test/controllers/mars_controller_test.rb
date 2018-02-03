require 'test_helper'

class MarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mar = mars(:one)
  end

  test "should get index" do
    get mars_url
    assert_response :success
  end

  test "should get new" do
    get new_mar_url
    assert_response :success
  end

  test "should create mar" do
    assert_difference('Mar.count') do
      post mars_url, params: { mar: { currency: @mar.currency, name: @mar.name, rate: @mar.rate } }
    end

    assert_redirected_to mar_url(Mar.last)
  end

  test "should show mar" do
    get mar_url(@mar)
    assert_response :success
  end

  test "should get edit" do
    get edit_mar_url(@mar)
    assert_response :success
  end

  test "should update mar" do
    patch mar_url(@mar), params: { mar: { currency: @mar.currency, name: @mar.name, rate: @mar.rate } }
    assert_redirected_to mar_url(@mar)
  end

  test "should destroy mar" do
    assert_difference('Mar.count', -1) do
      delete mar_url(@mar)
    end

    assert_redirected_to mars_url
  end
end
