require "test_helper"

class PacientesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get pacientes_create_url
    assert_response :success
  end
end
