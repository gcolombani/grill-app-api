require 'test_helper'

class BarbecuesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @barbecue = barbecues(:one)
  end

  test "should get index" do
    get barbecues_url, as: :json
    assert_response :success
  end

  test "should create barbecue" do
    assert_difference('Barbecue.count') do
      post barbecues_url, params: { barbecue: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show barbecue" do
    get barbecue_url(@barbecue), as: :json
    assert_response :success
  end

  test "should update barbecue" do
    patch barbecue_url(@barbecue), params: { barbecue: {  } }, as: :json
    assert_response 200
  end

  test "should destroy barbecue" do
    assert_difference('Barbecue.count', -1) do
      delete barbecue_url(@barbecue), as: :json
    end

    assert_response 204
  end
end
