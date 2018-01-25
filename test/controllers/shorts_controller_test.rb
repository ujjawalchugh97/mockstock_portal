require 'test_helper'

class ShortsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get shorts_index_url
    assert_response :success
  end

end
