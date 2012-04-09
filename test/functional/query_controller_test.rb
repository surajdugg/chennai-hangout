require 'test_helper'

class QueryControllerTest < ActionController::TestCase
  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get result" do
    get :result
    assert_response :success
  end

end
