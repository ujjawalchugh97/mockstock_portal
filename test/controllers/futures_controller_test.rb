require 'test_helper'

class FuturesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get futures_index_url
    assert_response :success
  end

end
