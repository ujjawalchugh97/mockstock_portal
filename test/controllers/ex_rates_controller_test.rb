require 'test_helper'

class ExRatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ex_rate = ex_rates(:one)
  end

  test "should get index" do
    get ex_rates_url
    assert_response :success
  end

  test "should get new" do
    get new_ex_rate_url
    assert_response :success
  end

  test "should create ex_rate" do
    assert_difference('ExRate.count') do
      post ex_rates_url, params: { ex_rate: { m1: @ex_rate.m1, m1c: @ex_rate.m1c, m2: @ex_rate.m2, m2c: @ex_rate.m2c, rate: @ex_rate.rate } }
    end

    assert_redirected_to ex_rate_url(ExRate.last)
  end

  test "should show ex_rate" do
    get ex_rate_url(@ex_rate)
    assert_response :success
  end

  test "should get edit" do
    get edit_ex_rate_url(@ex_rate)
    assert_response :success
  end

  test "should update ex_rate" do
    patch ex_rate_url(@ex_rate), params: { ex_rate: { m1: @ex_rate.m1, m1c: @ex_rate.m1c, m2: @ex_rate.m2, m2c: @ex_rate.m2c, rate: @ex_rate.rate } }
    assert_redirected_to ex_rate_url(@ex_rate)
  end

  test "should destroy ex_rate" do
    assert_difference('ExRate.count', -1) do
      delete ex_rate_url(@ex_rate)
    end

    assert_redirected_to ex_rates_url
  end
end
