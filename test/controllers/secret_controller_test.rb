require 'test_helper'

class SecretControllerTest < ActionDispatch::IntegrationTest
  test "should get secret" do
    get secret_secret_url
    assert_response :success
  end

  test "should get show" do
    get secret_show_url
    assert_response :success
  end

end
