require "test_helper"

class GamesControllerTest < ActionDispatch::IntegrationTest
  test "should get multiplication" do
    get games_multiplication_url
    assert_response :success
  end

  test "should get addition" do
    get games_addition_url
    assert_response :success
  end

  test "should get subtraction" do
    get games_subtraction_url
    assert_response :success
  end

  test "should get division" do
    get games_division_url
    assert_response :success
  end
end
