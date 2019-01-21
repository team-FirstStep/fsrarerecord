require 'test_helper'

class DiscsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get discs_new_url
    assert_response :success
  end

  test "should get create" do
    get discs_create_url
    assert_response :success
  end

end
