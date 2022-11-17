require "test_helper"

class ResortsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @resort = resorts(:one)
  end

  test "should get index" do
    get resorts_url, as: :json
    assert_response :success
  end

  test "should create resort" do
    assert_difference("Resort.count") do
      post resorts_url, params: { resort: { description: @resort.description, email: @resort.email, name: @resort.name } }, as: :json
    end

    assert_response :created
  end

  test "should show resort" do
    get resort_url(@resort), as: :json
    assert_response :success
  end

  test "should update resort" do
    patch resort_url(@resort), params: { resort: { description: @resort.description, email: @resort.email, name: @resort.name } }, as: :json
    assert_response :success
  end

  test "should destroy resort" do
    assert_difference("Resort.count", -1) do
      delete resort_url(@resort), as: :json
    end

    assert_response :no_content
  end
end
