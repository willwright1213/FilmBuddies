require 'test_helper'

class VideoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get video_index_url
    assert_response :success
  end

  test "should get watch" do
    get video_watch_url
    assert_response :success
  end

  test "should get host" do
    get video_host_url
    assert_response :success
  end

end
