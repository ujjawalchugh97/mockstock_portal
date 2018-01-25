require 'test_helper'

class SfuturesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sfuture = sfutures(:one)
  end

  test "should get index" do
    get sfutures_url
    assert_response :success
  end

  test "should get new" do
    get new_sfuture_url
    assert_response :success
  end

  test "should create sfuture" do
    assert_difference('Sfuture.count') do
      post sfutures_url, params: { sfuture: { price_per_share: @sfuture.price_per_share, selling_price: @sfuture.selling_price, stock_id: @sfuture.stock_id, time: @sfuture.time } }
    end

    assert_redirected_to sfuture_url(Sfuture.last)
  end

  test "should show sfuture" do
    get sfuture_url(@sfuture)
    assert_response :success
  end

  test "should get edit" do
    get edit_sfuture_url(@sfuture)
    assert_response :success
  end

  test "should update sfuture" do
    patch sfuture_url(@sfuture), params: { sfuture: { price_per_share: @sfuture.price_per_share, selling_price: @sfuture.selling_price, stock_id: @sfuture.stock_id, time: @sfuture.time } }
    assert_redirected_to sfuture_url(@sfuture)
  end

  test "should destroy sfuture" do
    assert_difference('Sfuture.count', -1) do
      delete sfuture_url(@sfuture)
    end

    assert_redirected_to sfutures_url
  end
end
