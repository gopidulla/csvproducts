require 'test_helper'

class BillImportsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get bill_imports_new_url
    assert_response :success
  end

end
