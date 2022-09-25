require "test_helper"

class RequestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'requester should be a user' do
    request = requests(:request_one)

    assert request.requester.is_a?(User)
  end
end
