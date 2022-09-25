require "test_helper"

class RequestsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @request = requests(:request_one)
  end

  routes = [
    {action: 'show', method: :get, url: '/requests/1', params: nil},
    {action: 'edit', method: :get, url: '/requests/1/edit', params: nil},
    {action: 'update', method: :patch, url: '/requests/1', params: { request: { requester_id: 1 } }},
  ]

  routes.each do |route|
    test "should not have #{route[:action]} route" do
      assert_raises(ActionController::RoutingError) do
        send(route[:method], route[:url], params: route[:params])
      end
    end
  end

  # test "should get index" do
  #   get requests_url
  #   assert_response :success
  # end

  # test "should get new" do
  #   get new_request_url
  #   assert_response :success
  # end

  test "should create request if user is logged in and show is open" do
    music = musics(:music_one)
    user = users(:user_one)
    show = shows(:show_one_open)

    sign_in(user)

    assert_difference('Request.count') do
      post requests_url, params: { request: { music_id: music.id, requester: user.id, show_id: show } }
    end

  end

  test "should destroy request" do
    assert_difference('Request.count', -1) do
      delete request_url(@request)
    end

  end

end
