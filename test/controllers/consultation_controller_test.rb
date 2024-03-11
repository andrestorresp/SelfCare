require "test_helper"

class ConsultationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get consultation_index_url
    assert_response :success
  end

  test "should get show" do
    get consultation_show_url
    assert_response :success
  end

  test "should get edit" do
    get consultation_edit_url
    assert_response :success
  end

  test "should get create" do
    get consultation_create_url
    assert_response :success
  end

  test "should get update" do
    get consultation_update_url
    assert_response :success
  end
end
