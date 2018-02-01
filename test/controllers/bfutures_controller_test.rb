require 'test_helper'

class BfuturesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bfuture = bfutures(:one)
  end

  test "should get index" do
    get bfutures_url
    assert_response :success
  end

  test "should get new" do
    get new_bfuture_url
    assert_response :success
  end

  test "should create bfuture" do
    assert_difference('Bfuture.count') do
      post bfutures_url, params: { bfuture: { buying_price: @bfuture.buying_price, price_per_share: @bfuture.price_per_share, stock_id: @bfuture.stock_id, time: @bfuture.time } }
    end

    assert_redirected_to bfuture_url(Bfuture.last)
  end

  test "should show bfuture" do
    get bfuture_url(@bfuture)
    assert_response :success
  end

  test "should get edit" do
    get edit_bfuture_url(@bfuture)
    assert_response :success
  end

  test "should update bfuture" do
    patch bfuture_url(@bfuture), params: { bfuture: { buying_price: @bfuture.buying_price, price_per_share: @bfuture.price_per_share, stock_id: @bfuture.stock_id, time: @bfuture.time } }
    assert_redirected_to bfuture_url(@bfuture)
  end

  test "should destroy bfuture" do
    assert_difference('Bfuture.count', -1) do
      delete bfuture_url(@bfuture)
    end

    assert_redirected_to bfutures_url
  end
end
